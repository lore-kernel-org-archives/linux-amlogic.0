Return-Path: <SRS0=mN7q=IQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10650C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 18:17:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80ED64F24
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Mar 2021 18:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80ED64F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pMYrUvpdiLovXlUOyUzyC5RWJrhb089yj2efsHgqb9I=; b=ZUVaZLhWnjkKnDTIyq279o/LU
	/EOgLj8tPZ/o/t6HV57A7jpyxtioSb4BfaTWTTX36vdG2j70+99du6T4Qf4/lp8cB722Qw+RnQnTL
	rAYgV5ziHS6pg1/vi87OdEUfd4SK48KEz0i1/WIgfAO0EzqQUssk8k3Z34wNyQvygCGbIgn3CpLuS
	A0aMOIhr4cUrJoLIQq6SNvW8ytQ+Nk2QaAjdgCppiJs8ngfTPd8LQVGpWaegqyrxDsTnjq23H+fLY
	SIdaDIV5EVAVEv0GQnSAZBoZ8ecoEh5MUdogE9FwGB8eygYnP2hx1rorKa9qhSUHHOjX0prKz2fw+
	v8KDyosQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMxD9-005pgn-Dz; Thu, 18 Mar 2021 18:17:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMxD1-005pfx-3c; Thu, 18 Mar 2021 18:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=uy/e6z9+oJp6vKoPGBExi+Rrh2Bm3IFId6EhyarhNcU=; b=WPv6p3JfvQc55Ue08vc8arTJGC
 9vFa8DEA/PVKHwRrjMEKuqv1IO0H+1OLCWkbDnZ/tCAYvnxlQzT5QyOWiwkZz5VvXVZyhGEGfY8uQ
 G9uNC66nRG8TwswKbMaboIcvFvb+miVS9HlZ1pPpxuYKY4I+/LOkJyncbZfEG0/FVNti1jlpDsqJI
 Kaiwizog0c/339kfPUW5jeia5GFoEkpFRoX9+hmKCkwpvx/mavnLNV8JmAnb+2t2VH3nRTPhYmmrY
 4Lgx8nMPRt/fv1NVtgAS/JVowTpKCplyHZW/100uQ6qgBjwzYT56OssyWpDvxJOOV4x38ognQTbLF
 GLnPc0xw==;
Received: from [2601:1c0:6280:3f0::9757]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMxCM-003L3E-WF; Thu, 18 Mar 2021 18:16:53 +0000
Subject: Re: [PATCH] drm/meson: Fix few typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, narmstrong@baylibre.com,
 airlied@linux.ie, daniel@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210318110046.14830-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a7c40d1a-053c-9e49-cb04-684c47abffa2@infradead.org>
Date: Thu, 18 Mar 2021 11:16:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318110046.14830-1-unixbhaskar@gmail.com>
Content-Language: en-US
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

On 3/18/21 4:00 AM, Bhaskar Chowdhury wrote:
> 
> s/initialy/initially/
> s/desined/designed/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/meson/meson_venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 5e2236ec189f..3c55ed003359 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -45,7 +45,7 @@
>   * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
>   * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
>   * The ENCP is designed for Progressive encoding but can also generate
> - * 1080i interlaced pixels, and was initialy desined to encode pixels for
> + * 1080i interlaced pixels, and was initially designed to encode pixels for
>   * VDAC to output RGB ou YUV analog outputs.
>   * It's output is only used through the ENCP_DVI encoder for HDMI.
>   * The ENCL LVDS encoder is not implemented.
> --


-- 
~Randy


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
