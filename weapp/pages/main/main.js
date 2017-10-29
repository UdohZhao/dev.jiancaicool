// main.js
var sliderWidth = 96; // 需要设置slider的宽度，用于计算中间位置
const App = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    coupon: true,
    domain: App.data.domain,
    technicalSupport: App.data.technicalSupport,
    activeIndex: 0,
    sliderOffset: 0,
    sliderLeft: 0,
    imgUrls: ['http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg',    'http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg',   'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'],
    indicatorDots: true,
    autoplay: true,
    interval: 5000,
    duration: 1000
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    var that = this;

    // 友好体验开始
    wx.showLoading({
      title: '加载中',
    })
  
    // 请求首页数据（普通商品分类，普通商品）
    wx.request({
      url: App.data.domain +'/main/getData',
      data: {
        type: 0
      },
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
    
          // 赋值
          that.setData({
            gcData: res.data.data.gcData,
            gData: res.data.data.gData,
            banner: res.data.data.banner
          })

          console.log(that.data.gcData)
          console.log(that.data.gData)

          // 获取设备基础信息
          wx.getSystemInfo({
            success: function (res) {
              that.setData({
                sliderLeft: (res.windowWidth / that.data.gcData.length - sliderWidth) / 2,
                sliderOffset: res.windowWidth / that.data.gcData.length * that.data.activeIndex
              });
            }
          })

      },
      fail: function (e) {
        console.log(e)
        wx.showModal({
          title: '网络错误',
          content: '请点击确定刷新页面!',
          showCancel: false,
          success: function (res) {
            if (res.confirm) {
              wx.reLaunch({
                url: '/pages/main/main'
              })
            }
          }
        })
      }
    })

    // 友好体验结束
    setTimeout(function () {
      wx.hideLoading()
    }, 2000)

    // 首次关注？
    wx.request({
      url: App.data.domain + '/wechatUser/add',
      data: {
        openid: wx.getStorageSync('openid')
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      success: function (res) {

        console.log(res.data);

        if (res.data.code == 0) {
          // 赋值
          that.setData({
            coupon: false,
            couponType: 1,
            dcData: res.data.data
          })
        }

      },
      fail: function (e) {
        console.log(e)
        wx.showModal({
          title: '网络错误',
          content: '请点击确定刷新页面!',
          showCancel: false,
          success: function (res) {
            if (res.confirm) {
              wx.reLaunch({
                url: '/pages/main/main'
              })
            }
          }
        })
      }
    })  

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },

  /**
   * 选项卡点击事件
   */
  tabClick: function (e) {
    var that = this
    that.setData({
      sliderOffset: e.currentTarget.offsetLeft,
      activeIndex: e.currentTarget.id
    });

    // 获取商品类别id
    var gcid = e.currentTarget.dataset.gcid;
    console.log(gcid);

    // 友好体验开始
    wx.showLoading({
      title: '加载中',
    })

    // 请求首页数据（普通商品）
    wx.request({
      url: App.data.domain + '/main/getCorrelation/type/0/gcid/'+gcid,
      header: {
        'content-type': 'application/json'
      },
      success: function (res) {
        
          // 赋值
          that.setData({
            gData: res.data.data.gData
          })

          console.log(that.data.gData)

      },
      fail: function (e) {
        console.log(e)
        wx.showModal({
          title: '网络错误',
          content: '请点击确定刷新页面!',
          showCancel: false,
          success: function (res) {
            if (res.confirm) {
              wx.reLaunch({
                url: '/pages/main/main'
              })
            }
          }
        })
      }
    })

    // 友好体验结束
    setTimeout(function () {
      wx.hideLoading()
    }, 2000)

  },

  /**
   * 转到商品详细
   */
  gotoGoodsDetail: function (e) {

    // 获取商品id
    var gid = e.currentTarget.dataset.gid;

    // 前往
    wx.navigateTo({
      url: '/pages/goodsDetail/goodsDetail?gid=' + gid
    })
    
  },
  changeIndicatorDots: function (e) {
    this.setData({
      indicatorDots: !this.data.indicatorDots
    })
  },

  /**
   * 立即领取优惠券
   */
  hideGetCoupon: function (e) {

    var that = this;

    console.log(e.currentTarget.dataset.price);
    console.log(wx.getStorageSync('openid'));

    // 请求累加优惠额度
    wx.request({
      url: App.data.domain + '/discountsAdd/add',
      data: {
        openid: wx.getStorageSync('openid'),
        price: e.currentTarget.dataset.price
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      method: 'POST',
      success: function (res) {

        console.log(res);

        // if 
        if (res.data.code == 1) {
          wx.showModal({
            title: '提示',
            content: res.msg,
            showCancel: false
          })
        }

        that.setData({
          coupon: true
        });

      },
      fail: function (e) {
        console.log(e)
        wx.showModal({
          title: '网络错误',
          content: '请点击确定刷新页面!',
          showCancel: false,
          success: function (res) {
            if (res.confirm) {
              wx.reLaunch({
                url: '/pages/main/main'
              })
            }
          }
        })
      }
    })


  }

})