Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F650EB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdX3iQV5Yee2SNwyeodREwYmOJPK1fyUVnRJL/T+cwM=; b=EGpdJXCnBY2kgH
	Xyfqv2orF80rX3AYPYSPnBsL4sf4oqlrunJ4ojU48F+1L0WE8kv6as+wBKY7Gu9u8k08VT5hyivg3
	Kvx1Y/QH4SVp3BwHTszAvcWAKqlO4WSwaCm1+wI94ktGgwBGPYJSZWiXxUTSc38yyf/+NktF/UQMl
	7FB96XUpqBtNew2APW1B755X/yYFT0UF18W/QwuFNHxhde1tqPgEm3gkH1EV1zrrmJ3M9WW2YtTAX
	7UJvZVqHOKcNvzk/K/8DdvYtPopPx9ZVHjOHq2Ku8ui/kNEeqq3ng4OYNC9AGq4Zokk2735retwvK
	oLGtVmTqSgojSIhOJEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9WoS-00CcUn-1Q;
	Wed, 14 Jun 2023 20:09:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9WoP-00CcUH-1G;
	Wed, 14 Jun 2023 20:09:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977d55ac17bso173826266b.3;
        Wed, 14 Jun 2023 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686773386; x=1689365386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FALpc4CIrB//ZcpcSjwXZfBNeerIA6IcWIarPTZ5JE=;
        b=rVmybFrpc9dOcqAVPlAskhPEpZF8f0OhSteMWTJ3DxCq8hL5HqRj2gwtxp10MczoZ8
         39W4Srq3Ek90PwISemnaguLFfXyMgHFbi04p1wze1CzP26GtHyvK/5BAOet2wgGnpvqh
         t0iVfwb8lCrhbALLC6lofqzFQacACtZa1i4grt24D75LfDgNXryhda2884PCbQ/nqtr4
         iZjrikUtJkDRp+tenSVWSiDpaXLZP0zQ6I288PdT0VQC/YBOTcZ7pmEPvm3PdPHW/jvI
         e1maBTL0WZrcTjTy5CfboO+35TG4nEHXyh0KOHj8yFhnGJ4DhPDYQlJmc78pBNsCei12
         A15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773386; x=1689365386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FALpc4CIrB//ZcpcSjwXZfBNeerIA6IcWIarPTZ5JE=;
        b=NT+JZ67x+EopvyP+hDt8xqpAcTl9JnSp4grp3Poqo+zFTOx/JnOR/NApjJTSxwWPZe
         LYQJlwQY2hNkcYUiX/AllvzPQK9icngHgG4o2dRs+2xMVMEOLfu/wNshJQXD6BvXOZXH
         E6x0lxx49XcfbJypXbl4QvkqqIfGdblVFXGAa9scTtrHWwcBsk0cFzP8yRcEKfZJXm3t
         64Mvz8pJsoIRaTLSm8q6h2Nz/5n092IRXfXbN8Z9AJtj2BVZwAg78Sh8sokdHu+7GC7K
         4smen3FnLud7PUvqlBvKsS4U7FqB0tKZgjOLRKtUiMEdUM9oYeaaE2/xCLQWSXsvfZnq
         a1gg==
X-Gm-Message-State: AC+VfDxF4tz6/ydMiSOX6GWRhy4k4Lc6aE6p2oWVe7kO0XervWXZHe6V
	lGiO+Ulgee3jHVGdm4nsOcPJ4keDwhLTw02/PTg4jeiD0Rk=
X-Google-Smtp-Source: ACHHUZ4/qC4MhwCSyqp8SJs6gvPJtQ1xsJxysBpYsuE007Ebn2AOYkTRl+n4q9AftOeW30jhKU27oIHrVSNnZIjl4Lc=
X-Received: by 2002:a17:906:dacd:b0:97a:97d3:1a3a with SMTP id
 xi13-20020a170906dacd00b0097a97d31a3amr15378599ejb.25.1686773386428; Wed, 14
 Jun 2023 13:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 14 Jun 2023 22:09:35 +0200
Message-ID: <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_130949_449519_5AEEF256 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTA6NDjigK9BTSBKaWFwZW5nIENob25nCjxqaWFwZW5n
LmNob25nQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+IE5vIGZ1bmN0aW9uYWwgbW9kaWZp
Y2F0aW9uIGludm9sdmVkLgo+Cj4gLi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmM6MzczOjIt
MzogVW5uZWVkZWQgc2VtaWNvbG9uLgo+Cj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFj
aUBsaW51eC5hbGliYWJhLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vYnVnemlsbGEub3BlbmFub2xp
cy5jbi9zaG93X2J1Zy5jZ2k/aWQ9NTUzMwo+IFNpZ25lZC1vZmYtYnk6IEppYXBlbmcgQ2hvbmcg
PGppYXBlbmcuY2hvbmdAbGludXguYWxpYmFiYS5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
