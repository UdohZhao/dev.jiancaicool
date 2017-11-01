// cart.js
var App = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    checkCoupon: true,
    onSubmit: false,
    domain: App.data.domain,
    technicalSupport: App.data.technicalSupport,
    carts: [],               // 购物车列表
    hasList: false,          // 列表是否有数据
    totalPrice: 0,           // 总价，初始为0
    selectAllStatus: true    // 全选状态，默认全选
  
  },

  /**
 * 判断数组是否为空
 */
  isEmpty: function (value) {
    return (Array.isArray(value) && value.length === 0) || (Object.prototype.isPrototypeOf(value) && Object.keys(value).length === 0);
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    var that = this;

    // 登录态
    if (wx.getStorageSync('openid') == false) {
      wx.showModal({
        title: '登录态失效',
        content: '请点击确定重新获取登录态!',
        showCancel: false,
        success: function (res) {
          if (res.confirm) {
            wx.reLaunch({
              url: '/pages/main/main'
            })
          }
        }
      })
    } else {

      // 友好体验开始
      wx.showLoading({
        title: '加载中',
      })

      // 请求购物车数据
      wx.request({
        url: App.data.domain + '/cart/index',
        data: {
          openid: wx.getStorageSync('openid')
        },
        header: {
          'content-type': 'application/json'
        },
        success: function (res) {
          
          console.log(res.data);

          // if
          if (!that.isEmpty(res.data.data.cData)) {

            that.setData({
              hasList: true,
              carts: res.data.data.cData,
              coupon: res.data.data.coupon
            });

            that.getTotalPrice();

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

      // 友好体验结束
      setTimeout(function () {
        wx.hideLoading()
      }, 2000)

    }
  
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
    
    console.log('优惠券信息：' + wx.getStorageSync('iprice') + ',' + wx.getStorageSync('price'));
  
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
   * 当前商品选中事件
   */
  selectList(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    const selected = carts[index].selected;
    carts[index].selected = !selected;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 删除购物车当前商品
   */
  deleteList(e) {

    var that = this;

    wx.showModal({
      title: '确认删除吗？',
      content: '删除后无法恢复！',
      showCancel: true,
      success: function (res) {
        if (res.confirm) {

          // 请求删除
          wx.request({
            url: App.data.domain + '/cart/del',
            data: {
              openid: wx.getStorageSync('openid'),
              id: e.currentTarget.dataset.id
            },
            header: {
              'content-type': 'application/json'
            },
            success: function (res) {

              console.log(res.data);

              // if
              if (res.data.code == 400) {
                wx.showModal({
                  title: '删除失败',
                  content: res.data.msg,
                  showCancel: false,
                  success: function (res) {
                    if (res.confirm) {
                      console.log('用户点击了确定');
                    }
                  }
                })
              } else {

                const index = e.currentTarget.dataset.index;
                let carts = that.data.carts;
                carts.splice(index, 1);
                that.setData({
                  carts: carts
                });
                if (!carts.length) {
                  that.setData({
                    hasList: false
                  });
                } else {
                  that.getTotalPrice();
                }

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




        } else {
          console.log('用户点击了取消');
        }
      }
    })


  },

  /**
   * 购物车全选事件
   */
  selectAll(e) {
    let selectAllStatus = this.data.selectAllStatus;
    selectAllStatus = !selectAllStatus;
    let carts = this.data.carts;

    for (let i = 0; i < carts.length; i++) {
      carts[i].selected = selectAllStatus;
    }
    this.setData({
      selectAllStatus: selectAllStatus,
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 绑定加数量事件
   */
  addCount(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    let quantity = carts[index].quantity;
    quantity = Number(quantity) + 1;
    carts[index].quantity = quantity;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 绑定减数量事件
   */
  minusCount(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    let quantity = carts[index].quantity;
    if (quantity <= 1) {
      return false;
    }
    quantity = Number(quantity) - 1;
    carts[index].quantity = quantity;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let carts = this.data.carts;                  // 获取购物车列表
    let total = 0;
    let totalSs = 0;
    let totalPercentagePrice = 0;
    for (let i = 0; i < carts.length; i++) {         // 循环列表得到每个数据
      if (carts[i].selected) {                     // 判断选中才会计算价格
        total += carts[i].quantity * carts[i].gData.promotion_price - carts[i].gData.percentage_price;   // 所有价格加起来
        totalSs += carts[i].quantity * carts[i].gData.promotion_price;
        totalPercentagePrice += carts[i].quantity * carts[i].gData.percentage_price;
      }
    }
    this.setData({       // 最后赋值到data中渲染到页面
      carts: carts,
      totalPrice: total.toFixed(2),
      totalSsPrice: totalSs.toFixed(2),
      totalPercentagePrice: totalPercentagePrice.toFixed(2)
    });
  },

  /**
   * 结算
   */
  closeAnAccount(e) {

    var that = this

    let carts = that.data.carts;
    var cid = new Array();
    var gid = new Array();
    var cname = new Array();
    var specification = new Array();
    var gmodel = new Array();
    var isdelivery = new Array();
    var isinstallation = new Array();
    var promotion_price = new Array();
    var quantity = new Array();
    var totalPrice = that.data.totalPrice;
    for (let i = 0; i < carts.length; i++) {         // 循环列表得到每个数据
      if (carts[i].selected) {
        cid.push(carts[i].id);
        gid.push(carts[i].gid);
        cname.push(carts[i].gData.cname);
        promotion_price.push(carts[i].gData.promotion_price);
        specification.push(carts[i].specification);
        gmodel.push(carts[i].gmodel);
        isdelivery.push(carts[i].isdelivery);
        isinstallation.push(carts[i].isinstallation);
        quantity.push(carts[i].quantity);
      }
    }

    // cid
    if (that.isEmpty(cid)) {

      wx.showModal({
        title: '结算提示',
        content: '请选中需要结算的商品 :(',
        showCancel: false
      })

    } else if (parseFloat(that.data.totalPercentagePrice) > parseFloat(that.data.coupon) && that.data.onSubmit == false) {

      // 全额赋值
      that.setData({
        totalPrice: that.data.totalSsPrice
      });

      // 商品优惠额度大于自身优惠额度
      wx.showModal({
        title: '优惠提示',
        content: '由于您当前优惠额度不足以兑换，请全额支付 :(',
        showCancel: false,
        success: function (res) {
          if (res.confirm) {
            // 开启提交
            that.setData({
              onSubmit: true,
              checkCoupon: false
            });
          }
        }
      })

    } else {
      // 开启提交
      that.setData({
        onSubmit: true
      });
    }

    if (that.data.onSubmit == true) {

      // 订单数据
      console.log(cid);
      console.log(gid);
      console.log(cname);
      console.log(specification);
      console.log(gmodel);
      console.log(isdelivery);
      console.log(isinstallation);
      console.log(promotion_price);
      console.log(quantity);
      console.log(totalPrice);
      console.log(that.data.totalPercentagePrice);
      console.log(that.data.checkCoupon);

      // 结算数据同步缓存
      // wx.setStorageSync('iData', iData['cid']);

      // 友好体验开始
      wx.showLoading({
        title: '结算中',
      })

      // 生成待付款订单
      wx.request({
        url: App.data.domain + '/indent/add/openid/' + wx.getStorageSync('openid') + '/itype/0',
        data: {
          cid: cid,
          gid: gid,
          cname: cname,
          specification: specification,
          gmodel: gmodel,
          isdelivery: isdelivery,
          isinstallation: isinstallation,
          promotion_price: promotion_price,
          quantity: quantity,
          totalPrice: totalPrice,
          totalPercentagePrice: that.data.totalPercentagePrice,
          coupon: that.data.coupon,
          checkCoupon: that.data.checkCoupon
        },
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        method: 'POST',
        success: function (res) {

          console.log(res.data);

          // if 
          if (res.data.code == 400) {
            wx.showModal({
              title: '结算错误',
              content: res.data.msg,
              showCancel: false
            })

          } else {

            // 前往订单页面
            wx.navigateTo({
              url: '/pages/closeAnAccount/closeAnAccount?iid=' + res.data.data.iid
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

      // 友好体验结束
      setTimeout(function () {
        wx.hideLoading()
      }, 2000)

    }

  }

})