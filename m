Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE01C2D0E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 08:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECC22078E
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 08:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfHTIJWs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECC22078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3lGurkkPNnjsRNMa3alx+LkrooMcgdv0RHzAfUKEgPI=; b=EfHTIJWs5y1H71PyEGxu7ZXiS
	mbZmRzg0DbXmdiVMOIkpNaxjExNFFOG2kOpm7aDLtFeUvHSbbJcOH8njBiSIQDXVVywIYGyO4Ng6F
	9gIck5dZbpGWhhYMwdPSj1LxKVmU1IbEZjbIcPaANLTFYKZok/tCKt/UY1WLJPKmSTqkUairpI30e
	dmMueqIk+7lohUOf0fowzyn4XpCISKf6eum1V6UDPQKQ0CmHZYstesb81Zdi7i9XRYp5/UEIAILnL
	zRkwRDEMnhtj3SwcR+wL41TURxFyDy7XnoFtcrVHg+zR+AS0JvMag7nUYlWJsI7fej6lURPRML+or
	aAGOROI7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffe6-0002oJ-98; Thu, 19 Nov 2020 08:50:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffe0-0002nP-TJ; Thu, 19 Nov 2020 08:50:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 46EA21F455CA
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
To: Neil Armstrong <narmstrong@baylibre.com>, Marc Zyngier <maz@kernel.org>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
Date: Thu, 19 Nov 2020 08:50:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_035021_181980_6F14FD24 
X-CRM114-Status: GOOD (  26.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Please see the automated bisection report below about some kernel
errors on meson-gxbb-p200.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org, however this one
looks valid.

The bisection started with next-20201118 but the errors are still
present in next-20201119.  Details for this regression:

  https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/

The first error is:

  [   14.757489] Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP

Full log:

  https://storage.kernelci.org/next/master/next-20201119/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.html#L410

Some other platforms are failing to boot starting with
next-20201118 but it's unclear whether that's due to the same
issue.  They might lead to a successful bisection which would
help clarify this.  All the baseline test results can be found
here:

  https://kernelci.org/test/job/next/branch/master/kernel/next-20201119/plan/baseline/


Hope this helps.  Pleas let us know if you need some help to
reproduce the issue or try a fix.

Thanks,
Guillaume

On 19/11/2020 03:03, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
> 
> Summary:
>   Start:      205292332779 Add linux-next specific files for 20201118
>   Plain log:  https://storage.kernelci.org/next/master/next-20201118/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20201118/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.html
>   Result:     b33340e33acd drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     meson-gxbb-p200
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig
>   Test case:  baseline.dmesg.emerg
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit b33340e33acdfe5ca6a5aa1244709575ae1e0432
> Author: Marc Zyngier <maz@kernel.org>
> Date:   Mon Nov 16 20:07:44 2020 +0000
> 
>     drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
>     
>     Removing the meson-dw-hdmi module and re-inserting it results in a hang
>     as the driver writes to HDMITX_TOP_SW_RESET. Similar effects can be seen
>     when booting with mainline u-boot and using the u-boot provided DT (which
>     is highly desirable).
>     
>     The reason for the hang seem to be that the clocks are not always
>     enabled by the time we enter meson_dw_hdmi_init(). Moving this call
>     *after* dw_hdmi_probe() ensures that the clocks are enabled.
>     
>     Fixes: 1374b8375c2e ("drm/meson: dw_hdmi: add resume/suspend hooks")
>     Signed-off-by: Marc Zyngier <maz@kernel.org>
>     Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>     Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20201116200744.495826-5-maz@kernel.org
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 68826cf9993f..7f8eea494147 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -1073,8 +1073,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	DRM_DEBUG_DRIVER("encoder initialized\n");
>  
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> -
>  	/* Bridge / Connector */
>  
>  	dw_plat_data->priv_data = meson_dw_hdmi;
> @@ -1097,6 +1095,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> +	meson_dw_hdmi_init(meson_dw_hdmi);
> +
>  	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>  	if (next_bridge)
>  		drm_bridge_attach(encoder, next_bridge,
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> git bisect good 0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d
> # bad: [2052923327794192c5d884623b5ee5fec1867bda] Add linux-next specific files for 20201118
> git bisect bad 2052923327794192c5d884623b5ee5fec1867bda
> # good: [8ca2209e1117911bdca879e28c72ee59ad5b97f7] Merge remote-tracking branch 'crypto/master' into master
> git bisect good 8ca2209e1117911bdca879e28c72ee59ad5b97f7
> # bad: [3d72f72d6bf743e13c948737bac115114c93fd1b] Merge remote-tracking branch 'block/for-next' into master
> git bisect bad 3d72f72d6bf743e13c948737bac115114c93fd1b
> # good: [f017853ee200d5cac32099d5dd88a7e5fc30dde7] gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc misdemeanours
> git bisect good f017853ee200d5cac32099d5dd88a7e5fc30dde7
> # bad: [04e03037129068647393bee87dbcd8123465c271] Merge remote-tracking branch 'drm-misc/for-linux-next' into master
> git bisect bad 04e03037129068647393bee87dbcd8123465c271
> # good: [fc5d5d9744bc9c001c80d0a7b8b1f0ceb04314b2] drm/amdgpu: add DID for dimgrey_cavefish
> git bisect good fc5d5d9744bc9c001c80d0a7b8b1f0ceb04314b2
> # skip: [cc40c4752593c04ccd3f6ef6270c509823af42e0] drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
> git bisect skip cc40c4752593c04ccd3f6ef6270c509823af42e0
> # good: [2b5b95b1ff3d70a95013a45e3b5b90f1daf42348] mm: introduce vma_set_file function v4
> git bisect good 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> # bad: [511881a8301fc87fa479dd67d8e56c2ba3fc8c70] drm/mediatek/mtk_dpi: Remove unused struct definition 'mtk_dpi_encoder_funcs'
> git bisect bad 511881a8301fc87fa479dd67d8e56c2ba3fc8c70
> # good: [1b409fda60414186688d94a125ce5306f323af6d] drm: omapdrm: Replace HTTP links with HTTPS ones
> git bisect good 1b409fda60414186688d94a125ce5306f323af6d
> # skip: [1b72ea1eaa9e4168d7486d85463fbd2d57a1452c] drm/panel: s6e63m0: Implement reading from panel
> git bisect skip 1b72ea1eaa9e4168d7486d85463fbd2d57a1452c
> # good: [a7319c8f50c5e93a12997e2d0821a2f7946fb734] drm/udl: Fix missing error code in udl_handle_damage()
> git bisect good a7319c8f50c5e93a12997e2d0821a2f7946fb734
> # good: [4ee573086bd88ff3060dda07873bf755d332e9ba] Fonts: Add charcount field to font_desc
> git bisect good 4ee573086bd88ff3060dda07873bf755d332e9ba
> # good: [0405f94a1ae0586ca237aec0e859f1b796d6325d] drm/meson: dw-hdmi: Register a callback to disable the regulator
> git bisect good 0405f94a1ae0586ca237aec0e859f1b796d6325d
> # skip: [7467389bdafb77357090512d42a452bea31d53b5] drm/panel: Add ABT Y030XX067A 3.0" 320x480 panel
> git bisect skip 7467389bdafb77357090512d42a452bea31d53b5
> # skip: [400fb19dd63d7d2e3ab7243631704cf731f4b5ca] drm/exynos/exynos7_drm_decon: Supply missing description for param 'ctx'
> git bisect skip 400fb19dd63d7d2e3ab7243631704cf731f4b5ca
> # bad: [f8ef48ffa9d3bfd067416785efacf60d2a25a568] drm/armada/armada_overlay: Staticify local function 'armada_overlay_duplicate_state'
> git bisect bad f8ef48ffa9d3bfd067416785efacf60d2a25a568
> # bad: [e366a644c69d0909cb3ff3921c9c9ef4cff9a41d] dt-bindings: display: Add ABT Y030XX067A panel bindings
> git bisect bad e366a644c69d0909cb3ff3921c9c9ef4cff9a41d
> # bad: [81b7608e2b190426c33b9e7fc69fe96ae8408ebb] dt-bindings: vendor-prefixes: Add abt vendor prefix
> git bisect bad 81b7608e2b190426c33b9e7fc69fe96ae8408ebb
> # bad: [b33340e33acdfe5ca6a5aa1244709575ae1e0432] drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> git bisect bad b33340e33acdfe5ca6a5aa1244709575ae1e0432
> # first bad commit: [b33340e33acdfe5ca6a5aa1244709575ae1e0432] drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
> -------------------------------------------------------------------------------
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#3519): https://groups.io/g/kernelci-results/message/3519
> Mute This Topic: https://groups.io/mt/78357476/924702
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
