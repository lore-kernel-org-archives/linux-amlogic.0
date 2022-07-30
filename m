Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670A0C00144
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LOET1f+pb4jmdoqGwilif7nIYF6PxVJpzZhjXstd2M=; b=NFHOEE71uVtCwF
	jxk2lGWtSWcLm5e0y1z4TBkvFPsqx+/H8/QCRZoAhbtkQgu0dB0yplTxQgzKo0cQgHK8XRPDBoWK2
	kTwjROZErRVaLhTv6CgKE2BViytEs0nHglXAOEmQ0TtJHQtxtFQFePxsTkHZmbJ0H2KokK4eqOZhi
	e59S06kc5VJyleujbMTcGd3szJXUMHcEqZtolP5fHEWNHbwRYcGUdymWO17oG63DalI5LOrPra7PT
	dQKZupmumRsn/O0dYLEqlyjxYodJkZwTR7sRn1G3on/WZe8WOS5Dt6lemHxkQduUQryv3qaPRvgDU
	N91/4kUjIMUQtZj3VFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHclh-00FIgk-N8; Sat, 30 Jul 2022 03:03:57 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHclW-00FIdG-5x; Sat, 30 Jul 2022 03:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659150226; x=1690686226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWLJrWfiYOhP2GrDM/RfY8uWpLUU1KeC3w9W08D9/Mk=;
  b=hfwFptZB/4b1kRFXJQo1MGb8CC/l4ktViLyRsQjVFsrj98x3l0qftfVI
   XLyJQSE/4FP8pLY7LqQkfbhaE1SAbzufHlCPe9roTYCpMt8Nzz2T5o6o5
   KrMfWL4ypSDEIh+VIGWALHtPkhhByr8LRQo6IEhG3CO2nAWHtHDuacZEV
   mSdWsy7GpBr+cgm6DWQ71grXRR5+qLVTFyO0YLx3h9Q8Jgdmz51Ww4UDy
   W6fhw7nkueH6qDZRm9Bd1DeXWFJEEUdeldGmKmIx3t3sHhSASM5rZFMFg
   qfPMd974mf3ZKezHyH0uc19MlDCDVfbzLtbEWUyY2DCIXBYPtQUJxGvAM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="271926232"
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; 
   d="scan'208";a="271926232"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 20:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; 
   d="scan'208";a="704389955"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2022 20:03:35 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHclK-000CJh-1P;
	Sat, 30 Jul 2022 03:03:34 +0000
Date: Sat, 30 Jul 2022 11:03:08 +0800
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
Cc: kbuild-all@lists.01.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 22/35] drm/vc4: vec: Use TV Reset implementation
Message-ID: <202207301024.h3rifgQO-lkp@intel.com>
References: <20220728-rpi-analog-tv-properties-v1-22-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-22-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_200346_288652_BD8BFD0A 
X-CRM114-Status: GOOD (  12.96  )
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
base:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220730/202207301024.h3rifgQO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f380bf85052b89ae0ffc6cfdf2dc91cdcde5a75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
        git checkout 2f380bf85052b89ae0ffc6cfdf2dc91cdcde5a75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_vec.c:257:6: warning: no previous prototype for 'vc4_vec_connector_reset' [-Wmissing-prototypes]
     257 | void vc4_vec_connector_reset(struct drm_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/vc4_vec_connector_reset +257 drivers/gpu/drm/vc4/vc4_vec.c

   256	
 > 257	void vc4_vec_connector_reset(struct drm_connector *connector)
   258	{
   259		drm_atomic_helper_connector_reset(connector);
   260		drm_atomic_helper_connector_tv_reset(connector);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
