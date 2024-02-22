Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BE2C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GC2wZOka3R8PebD2PTAZkRDVDYqGnbz6sxLdnFxWc4=; b=IfTU8wBRaGltVQ
	cJcdQMEGF2K8gzca+yi3hKQs5B6lDK+3ava5q4DKELU6tmV3pJOgWrbgsDkLiMdJpWBZTaWhoXfis
	DjSU/IEoVrhv7F9guIj6GGSSszX+klk+3mrpIP/hzejoSwsK8oGR28Cv7FADoKS5U23mxMSXsfBzE
	bgyXm9vHgyyeEuzVyNlgwqBk4krLxp9yl3SR9EIHEiGUgfLYaoyIS3Zmn+v2GXZJi0xeTuuGybIZb
	qsh5Wk7oTFU61KdQNagtKRojV6fl0RrqAWRWhardVL2PDvUaAARj2NnoE2p1gUBA03wGffT6if3Q9
	r9CZJlavfbHN5PN52Q1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4jR-000000046cg-2gYs;
	Thu, 22 Feb 2024 08:47:05 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4jL-000000046c3-0eck;
	Thu, 22 Feb 2024 08:47:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BEC21145D8;
	Thu, 22 Feb 2024 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1708591613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=mkwao/Eo5HsXt33cPrj25cBHf9f0LM2OJqHCNPBQoQk=;
	b=t3k1AkUk93ro0Ha1DPQNiZFeqgLomxTYKcAOxje6QiAdWw51Uzna9GrUk980vJL0c2IFHn
	FvTKp1PMbJFrWNc3X2/jN1KTnOf237CShPYYyzddXxFIFyyQfogOIKtXkDzyNDek5cEe+v
	V60hi+9OjpdAc1RB6wzkYra0g/xXbLjgrG4r/i3xczjo+pCywI4v91kS3sWnA9r0mRGwSG
	28ePQQ3ajLTRE5zS7XIA+eFrBXMYOCzCh4oOSGvBY9f1uWfcUNKcXJy9T9vcKNgyJjTwdL
	B3NJDQXn6VUdIS/me1HU6ebpIUsZJ/GFYakXXKNnRNKHU/47rn1roMOlruGRqQ==
Message-ID: <16891eb5-ee2e-4b0d-a82d-517adf028474@lexina.in>
Date: Thu, 22 Feb 2024 11:46:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20240221143654.544444-3-adeep@lexina.in>
 <202402221322.ifGMGQa6-lkp@intel.com>
Content-Language: en-US, ru-RU
From: Viacheslav <adeep@lexina.in>
Autocrypt: addr=adeep@lexina.in; keydata=
 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
In-Reply-To: <202402221322.ifGMGQa6-lkp@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_004702_373312_6112D359 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi!

Will be fixed in next version with new Kconfig dependencies:

     depends on (ARM64 && ARCH_MESON || COMPILE_TEST) && MESON_SM=y
     default ARCH_MESON && MESON_SM

22/02/2024 08.35, kernel test robot wrote:
> Hi Viacheslav,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/soc-amlogic-meson-gx-socinfo-move-common-code-to-header-file/20240221-224803
> base:   9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
> patch link:    https://lore.kernel.org/r/20240221143654.544444-3-adeep%40lexina.in
> patch subject: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC Information driver
> config: arm64-randconfig-002-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402221322.ifGMGQa6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>     aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>     aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `socinfo_get_chipid':
>>> meson-gx-socinfo-sm.c:(.text+0xac): undefined reference to `meson_sm_call_read'
>     aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `meson_gx_socinfo_sm_probe':
>>> meson-gx-socinfo-sm.c:(.text+0x438): undefined reference to `meson_sm_get'
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
