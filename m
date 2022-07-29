Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ADC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stDbIHhwbv2aPsTke5n3udARMcwEs1/G0HSXRa5X18M=; b=xLWNn0yEWC9dW7
	0o6/z++PDGb5UZyKD9lSP8syV3IXo48U5/6uYI2UljFwzhjgdYqQvL9ye1KZUeO1OSqfJrC8EoisR
	l8w3SusP/xZFY+L9qokUfdHW3k9BqCTs0oKQ44ownhY1I6kbTGKshtQSNsm4Jo5J7E3zOomXQDLPW
	/MaD4wU8osbUoUweA+h7oDFwrKSwQl6nMS8es4ydSD96nuM8R/F2aAwbKxGt/XoSFO7FJskoH03GH
	u8Dp4WOHOnhRb0jwioElzprAxfs5VaYWuIOH3OpU+1113YZJUUHpGccgfgTXBsSP8n65K2MOmVvH5
	NEV+aEV5NOqpBwKsp78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWQa-00BwKw-0g; Fri, 29 Jul 2022 20:17:44 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWQL-00Bw5s-4l; Fri, 29 Jul 2022 20:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659125849; x=1690661849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHXzzmsjuJv9AN/O6EtjvRoPXkwz0wGDEtmwwZMap3k=;
  b=ntz6Ev5mgs/9L0QFfzRI5S5dt4Xx03sXfHuSxPdxcaEKLLBZLLjPHnoP
   tllYMrglA+TsIukNoEWbPCCcIB78EuWcUp6cqD3pHB+TKA2xTh/BEzffh
   aol1w0TNUieMYD79AjFLuw6vFxpvHnbrFE9R04zlzo5XEjOqTeGy/AD9O
   HVVNoJOGmcssajwY7VhZqEzQSiIMgZUV0g4WTEX7qQA/Pvmt835sSfSR9
   Q3NwWvQuw9+Aj61+0dy85RYGrPB7Pm2+4yy88UFJgporqQJAk7Vd/IORP
   1Bx4fe1WKX/Zs+PluK/UpTOyIo7UuSTQoQsgDOMWMUOPd3sUZ2KcEV3Sc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="286397912"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="286397912"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 13:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="598355595"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2022 13:17:21 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHWQC-000C3x-2S;
	Fri, 29 Jul 2022 20:17:20 +0000
Date: Sat, 30 Jul 2022 04:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 33/35] drm/connector: Remove TV modes property
Message-ID: <202207300454.3rIc8wpM-lkp@intel.com>
References: <20220728-rpi-analog-tv-properties-v1-33-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-33-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_131729_273634_2DE62800 
X-CRM114-Status: GOOD (  12.43  )
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

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
base:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: riscv-randconfig-r042-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300454.3rIc8wpM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/83327cd72054a9c8d02b6f632453a8bdc90d3797
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
        git checkout 83327cd72054a9c8d02b6f632453a8bdc90d3797
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:656:51: error: too many arguments to function call, expected 2, have 3
           drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~
   include/drm/drm_connector.h:1807:5: note: 'drm_mode_create_tv_properties' declared here
   int drm_mode_create_tv_properties(struct drm_device *dev,
       ^
   1 error generated.


vim +656 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c

6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  633  
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  634  static int nv17_tv_create_resources(struct drm_encoder *encoder,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  635  				    struct drm_connector *connector)
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  636  {
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  637  	struct drm_device *dev = encoder->dev;
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2012-07-31  638  	struct nouveau_drm *drm = nouveau_drm(dev);
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  639  	struct drm_mode_config *conf = &dev->mode_config;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  640  	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
cb75d97e9c7774 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2012-07-11  641  	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  642  	int num_tv_norms = dcb->tvconf.has_component_output ? NUM_TV_NORMS :
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  643  							NUM_LD_TV_NORMS;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  644  	int i;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  645  
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  646  	if (nouveau_tv_norm) {
2574c809d7c0f0 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c YueHaibing 2019-12-30  647  		i = match_string(nv17_tv_norm_names, num_tv_norms,
2574c809d7c0f0 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c YueHaibing 2019-12-30  648  				 nouveau_tv_norm);
2574c809d7c0f0 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c YueHaibing 2019-12-30  649  		if (i < 0)
77145f1cbdf8d2 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2012-07-31  650  			NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  651  				nouveau_tv_norm);
2574c809d7c0f0 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c YueHaibing 2019-12-30  652  		else
2574c809d7c0f0 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c YueHaibing 2019-12-30  653  			tv_enc->tv_norm = i;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  654  	}
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  655  
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11 @656  	drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  657  
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  658  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  659  					conf->tv_select_subconnector_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  660  					tv_enc->select_subconnector);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  661  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  662  					conf->tv_subconnector_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  663  					tv_enc->subconnector);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  664  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  665  					conf->tv_mode_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  666  					tv_enc->tv_norm);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  667  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  668  					conf->tv_flicker_reduction_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  669  					tv_enc->flicker);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  670  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  671  					conf->tv_saturation_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  672  					tv_enc->saturation);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  673  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  674  					conf->tv_hue_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  675  					tv_enc->hue);
2db83827dc7679 drivers/gpu/drm/nouveau/nv17_tv.c         Rob Clark  2012-10-11  676  	drm_object_attach_property(&connector->base,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  677  					conf->tv_overscan_property,
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  678  					tv_enc->overscan);
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  679  
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  680  	return 0;
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  681  }
6ee738610f41b5 drivers/gpu/drm/nouveau/nv17_tv.c         Ben Skeggs 2009-12-11  682  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
