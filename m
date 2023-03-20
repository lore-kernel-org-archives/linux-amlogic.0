Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B4C7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsg8vCMoXAWJL9yg65kKO6LJ/O1+Qx51yyfDpbX0B2A=; b=PNh5by1zCxeZ8N
	HrVYZqCiww9F1/HaCFh7YmakaMsrVnzA+sZliPnM4T/ad9hFSU6xdquYoRIRhCdfe/ov61yxTlAwJ
	jTux+hI4CAl3/PGNlslBhpZgDma0+u5YhnnzkQ1D+Liv6jrKE8Z+gnPWiebmzq+a/jNMxpMReKDwO
	kg0osF7NWsnmRzAxOHb3RliUSMfnFD/hkPs6EsIoF4l7lI5KLjALSpqbPVzndo2LdDm7J45vkJ2hS
	7VjMwXQLtWhYloNbT2JmgLwvqxkAqqpLkzXFuJWn5CmsUBzrOaYTKwRqv5Mlm9ijjWClQddyovO+e
	r02HHfONDIBaesc0i+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHYR-009aFt-08;
	Mon, 20 Mar 2023 15:36:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHYN-009aEC-0a;
	Mon, 20 Mar 2023 15:36:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id ek18so48386508edb.6;
        Mon, 20 Mar 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679326562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7O9sQEBEyADAKShtHU/SV4p9FNZJbLKQq8Lw4CGcFY=;
        b=BE6GpoyPw/AtySquV40eHJgpL6SWYMenmYeYMtclwKiXWHVXC9JA+1/Gxrb3tRXE2e
         mNLG6v+SbrTxH0SjFNiidBlc1dG2gIEVMRLo/QATdLrNyk2/m2UtzyEEJ2aO1mSnLiEK
         xlqlAs6KgNI6qc2pV8iZjzUCSmjDp5ebWTXKQh800VGtbci9onYhEVblyftUBDkPDWnh
         ntskMDf5QBsqXI3wfTi/2cdsoO2xnjuQyUHy4N4Qrgv2ZXCo3tnEBiQOwNVeAEYzIAk1
         7tlXARNcqsM/VOOFigg4VX+5tQVJOS0eWYlyerqoWLNXzWJCy+qbt7KPu4ut4NNevIs+
         QN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7O9sQEBEyADAKShtHU/SV4p9FNZJbLKQq8Lw4CGcFY=;
        b=MMgI8dlflrL37I7Nk3xPippx2oYaZUKUOBwLBVK/GuIlhNHcjSScBMuBpPgOMbwktJ
         b48q/xWpR9yIknpr8/1G8KQXItx6ZfMOgU8qM8ygfGdAacymCxUvQEV7+ddWl5+KtxJ3
         UET19yJKA+Og6Wj628arai/9zqq8SzLvGJVyrWgy64+kYQdfHcEt97ZhUIKuYHzVyk65
         DRKS78Bo0t4SYAFRxFyvoyzD2u0IkCfzlncE84OW57lWwMe2XbbalsJKbeizY/nCT0fF
         +MsedbuwidVcxEWmdZAu5zAo+/atTqblcmFkRktmm1SuN3RlpVXprJ0hzvna7PgckLRF
         tT0A==
X-Gm-Message-State: AO0yUKX980u/b7HlqJzlvw4Ut/kdpATZAS+tebupiV0cvpP0ajxpklov
	oO1YYlMqiYKemPsDifT3cIhLgq/pIlFE7/q7Dh4=
X-Google-Smtp-Source: AK7set+uH28cMFUpa6epWEpBR3ODSq1DYQPiF68MjOnhPNWsv1RcqqFuNC7TRJTOxtvfIB6B1/dwSy8yOuTgBc4MgO4=
X-Received: by 2002:a17:906:3e1a:b0:930:90ce:a1a6 with SMTP id
 k26-20020a1709063e1a00b0093090cea1a6mr3861875eji.6.1679326561903; Mon, 20 Mar
 2023 08:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230320113445.17260-1-yu.tu@amlogic.com>
In-Reply-To: <20230320113445.17260-1-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Mar 2023 16:35:50 +0100
Message-ID: <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops support
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, kelvin.zhang@amlogic.com, qi.duan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_083607_218554_962D8F90 
X-CRM114-Status: GOOD (  15.53  )
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

SGVsbG8gWXUgVHUsCgpPbiBNb24sIE1hciAyMCwgMjAyMyBhdCAxMjozNeKAr1BNIFl1IFR1IDx5
dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB0aGUgcHJldmlvdXMgY29kZSBvbmx5
IHByb3ZpZGVzICJyb19vcHMiIGZvciB0aGUgdmlkX3BsbF9kaXYKPiBjbG9jay4gSW4gZmFjdCwg
dGhlIGNsb2NrIGNhbiBiZSBzZXQuIFNvIGFkZCAib3BzIiB0aGF0IGNhbiBzZXQgdGhlCj4gY2xv
Y2ssIGVzcGVjaWFsbHkgZm9yIGxhdGVyIGNoaXBzIGxpa2UgUzQgU09DIGFuZCBzbyBvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPiAtLS0KcGxlYXNlIGRl
c2NyaWJlIHRoZSBjaGFuZ2VzIHlvdSBkaWQgY29tcGFyZWQgdG8gdGhlIHByZXZpb3VzIHZlcnNp
b24ocykKClsuLi5dCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2
LmggYi9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oCj4gaW5kZXggYzAxMjhlMzNjY2Y5
Li5iYmNjYWIzNDA5MTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1k
aXYuaAo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmgKPiBAQCAtMTAsMTEg
KzEwLDE0IEBACj4gICNpbmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KPiAgI2luY2x1ZGUg
InBhcm0uaCIKPgo+ICsjZGVmaW5lIFZJRF9QTExfRElWX1RBQkxFX1NJWkUgICAgICAgICAxNApJ
biB2MSB5b3UgdXNlZCBBUlJBWV9TSVpFKHZpZF9wbGxfZGl2X3RhYmxlKSB3aGVyZXZlciB0aGlz
IG5ldyBtYWNybwppcyB1c2VkIGluc3RlYWQuCkkgdGhpbmsgdXNpbmcgQVJSQVlfU0laRSBpcyB0
aGUgYmV0dGVyIGFwcHJvYWNoIGJlY2F1c2UgaXQgbWVhbnMgdGhlCnJlZmVyZW5jZXMgd2lsbCB1
cGRhdGUgYXV0b21hdGljYWxseSBpZiBhbiBlbnRyeSBpcyBhZGRlZC9yZW1vdmVkIGZyb20Kdmlk
X3BsbF9kaXZfdGFibGUKCkFsc28gSSB0aGluayB0aGVyZSdzIGEgZGlmZmVyZW50IHVuZGVyc3Rh
bmRpbmcgYWJvdXQgd2hhdCBKZXJvbWUKcHJldmlvdXNseSB3cm90ZToKPiBJdCB3b3VsZCBiZSBu
aWNlIHRvIGFjdHVhbGx5IGRlc2NyaWJlIGhvdyB0aGlzIHZpZCBwbGwgd29yayBzbyB3ZSBjYW4K
PiBzdG9wIHVzaW5nIHByZWNvbXB1dGUgIm1hZ2ljIiB2YWx1ZXMgYW5kIGFjdHVhbGx5IHVzZSB0
aGUgSVAgdG8gaXRzIGZ1bGwKPiBjYXBhY2l0eS4KRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBpcyB0
aGF0IHlvdSBpbnRlcnByZXRlZCB0aGlzIGFzICJsZXQncyBjaGFuZ2UKQVJSQVlfU0laRSh2aWRf
cGxsX2Rpdl90YWJsZSkgdG8gYSBuZXcgbWFjcm8gY2FsbGVkClZJRF9QTExfRElWX1RBQkxFX1NJ
WkUiLgpCdXQgSSB0aGluayB3aGF0IEplcm9tZSBtZWFudCBpczogImxldCdzIGdldCByaWQgb2Yg
dmlkX3BsbF9kaXZfdGFibGUKYW5kIGltcGxlbWVudCBob3cgdG8gYWN0dWFsbHkgY2FsY3VsYXRl
IHRoZSBjbG9jayByYXRlIC0gd2l0aG91dApoYXJkLWNvZGluZyAxNCBwb3NzaWJsZSBjbG9jayBz
ZXR0aW5ncyBpbiB2aWRfcGxsX2Rpdl90YWJsZSIuIExvb2sgYXQKY2xrLW1wbGwuYyBhbmQvb3Ig
Y2xrLXBsbC5jIHdoaWNoIGFsbG93IGNhbGN1bGF0aW5nIGFyYml0cmFyeSByYXRlcwp3aXRob3V0
IGFueSBoYXJkLWNvZGVkIHRhYmxlcy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
