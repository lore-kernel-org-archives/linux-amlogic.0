Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DF7C47258
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jan 2024 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0GI1+b0gi4b7D9c7IgcpmMmUT8ME8lv37dvqh6btdw=; b=KQ3asXcAjNzMp+
	NeOxnd0So+ec3mYyKbBjWl8sTOYOW/mSU+NvGWSehkkZguHOAX0juVRqw48FyDzYlnWbS+SwFkluV
	WKl9OOtG3IC2CGxW4R/XhToENBKshJRKTLpnJBiURculEfc9DxMgAYVXe9GYmTI8KHkBrx10zwSnc
	8pGtn+FFwCNNjgHXymIzO6mmMWS+E6x2P5BySxM/Wn+AbweZhIBRnoALVgXbj8RJ0baQKe0XvKGdw
	ywsm5PdkKus8+bxAa/xYZXx4OsmQgHcm/9SQzKZTKNRHhpud3MXGiqT2LrEKDY0vva1m0PWDccBAX
	g3+ZWR96LNX7cHgvieNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRAc-009qkL-10;
	Mon, 15 Jan 2024 17:54:46 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRAY-009qjY-0I;
	Mon, 15 Jan 2024 17:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705341282; x=1736877282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GDOv+KMLJXKRPES2lOk9CeXDyPmRMw69IQKLB2cntJM=;
  b=K4KDQ/0xuHTjNXoyMqiSRRRp4W1Oh8rqGIol2ktfm8iri7B3uEL2/IYL
   9D/HsxNE0GF4g0D7MDBnzSXzDDOc5lsVkRym931kqcY5TIIOmMGtBmOQO
   2pxlHmmErsOuIxz0eCcmi18j0nbwUQk2zq9I2N+2O7LuCdOagmPU71suJ
   mviCVPagzlkms0s2KkbFQJ99RyAEQnYFpCukzNmb4OMDxhkOKisFRBsVn
   3psQlsDBPCeJiZGh2r5XknpyaOhQP6HvlQvcWAjvKe8sxJC9NGRSfVLsY
   4TdMbMTMo0I7UbvtdZlAYEzUJsfaKm2F3J9irI2oFwe7SB6DLVcEZjMxk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="466045462"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="466045462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 09:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="32190049"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2024 09:54:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPRAF-000Ce0-1n;
	Mon, 15 Jan 2024 17:54:27 +0000
Date: Tue, 16 Jan 2024 01:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
	victor.liu@nxp.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, hjc@rock-chips.com,
	heiko@sntech.de, yannick.fertre@foss.st.com,
	raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host
 probe breaks dsi device probe
Message-ID: <202401160108.j5Lqkppm-lkp@intel.com>
References: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_095442_227154_6B8D76D7 
X-CRM114-Status: GOOD (  15.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Farouk,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Farouk-Bouabid/drm-bridge-synopsys-dw-mipi-dsi-fix-deferred-dsi-host-probe-breaks-dsi-device-probe/20240113-020945
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240112180737.551318-1-farouk.bouabid%40theobroma-systems.com
patch subject: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host probe breaks dsi device probe
config: i386-buildonly-randconfig-002-20240115 (https://download.01.org/0day-ci/archive/20240116/202401160108.j5Lqkppm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160108.j5Lqkppm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160108.j5Lqkppm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:1187:5: warning: no previous prototype for '__dw_mipi_dsi_probe' [-Wmissing-prototypes]
    1187 | int __dw_mipi_dsi_probe(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/__dw_mipi_dsi_probe +1187 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

  1186	
> 1187	int __dw_mipi_dsi_probe(struct platform_device *pdev,
  1188			    const struct dw_mipi_dsi_plat_data *plat_data, struct dw_mipi_dsi **dsi_p)
  1189	{
  1190		struct device *dev = &pdev->dev;
  1191		struct reset_control *apb_rst;
  1192		struct dw_mipi_dsi *dsi;
  1193		int ret;
  1194	
  1195		*dsi_p = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
  1196		if (!*dsi_p)
  1197			return -ENOMEM;
  1198	
  1199		dsi = *dsi_p;
  1200	
  1201		dsi->dev = dev;
  1202		dsi->plat_data = plat_data;
  1203	
  1204		if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
  1205		    !plat_data->phy_ops->get_timing) {
  1206			DRM_ERROR("Phy not properly configured\n");
  1207			return -ENODEV;
  1208		}
  1209	
  1210		if (!plat_data->base) {
  1211			dsi->base = devm_platform_ioremap_resource(pdev, 0);
  1212			if (IS_ERR(dsi->base))
  1213				return -ENODEV;
  1214	
  1215		} else {
  1216			dsi->base = plat_data->base;
  1217		}
  1218	
  1219		dsi->pclk = devm_clk_get(dev, "pclk");
  1220		if (IS_ERR(dsi->pclk)) {
  1221			ret = PTR_ERR(dsi->pclk);
  1222			dev_err(dev, "Unable to get pclk: %d\n", ret);
  1223			return ret;
  1224		}
  1225	
  1226		/*
  1227		 * Note that the reset was not defined in the initial device tree, so
  1228		 * we have to be prepared for it not being found.
  1229		 */
  1230		apb_rst = devm_reset_control_get_optional_exclusive(dev, "apb");
  1231		if (IS_ERR(apb_rst)) {
  1232			ret = PTR_ERR(apb_rst);
  1233	
  1234			if (ret != -EPROBE_DEFER)
  1235				dev_err(dev, "Unable to get reset control: %d\n", ret);
  1236	
  1237			return ret;
  1238		}
  1239	
  1240		if (apb_rst) {
  1241			ret = clk_prepare_enable(dsi->pclk);
  1242			if (ret) {
  1243				dev_err(dev, "%s: Failed to enable pclk\n", __func__);
  1244				return ret;
  1245			}
  1246	
  1247			reset_control_assert(apb_rst);
  1248			usleep_range(10, 20);
  1249			reset_control_deassert(apb_rst);
  1250	
  1251			clk_disable_unprepare(dsi->pclk);
  1252		}
  1253	
  1254		dw_mipi_dsi_debugfs_init(dsi);
  1255		pm_runtime_enable(dev);
  1256	
  1257		dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
  1258		dsi->dsi_host.dev = dev;
  1259		dsi->bridge.driver_private = dsi;
  1260		dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
  1261		dsi->bridge.of_node = pdev->dev.of_node;
  1262	
  1263		ret = mipi_dsi_host_register(&dsi->dsi_host);
  1264		if (ret) {
  1265			dev_err(dev, "Failed to register MIPI host: %d\n", ret);
  1266			pm_runtime_disable(dev);
  1267			dw_mipi_dsi_debugfs_remove(dsi);
  1268			return ret;
  1269		}
  1270	
  1271	
  1272		return 0;
  1273	}
  1274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
