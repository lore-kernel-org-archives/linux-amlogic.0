Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11D3C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 08:33:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A34F222BB
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 08:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A34F222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UXBcy77udwcvPINCg2xWt0XdQ823Zp68xlV83IQNTMU=; b=izElSRG4yrgrO3DcJL/2DOB1r
	Ed0nHsX+M8l6HMVykozVpxER2e29/+ceOJjiJvFFPZNmPnx6xIzd8FD93chVgeyIQZzAbPziJkyjJ
	caYd0bawPFoHKHgqAWOAAc7ZrxE2QvMe3WA+FCLBzLWxc5UhWrWAn4PLQaJI5V4FMpiEwPgA2cddh
	c55T+C9s4vDzEoRqQijSbrf6EpD4IwUheTnQRCFrBIgWXto1ua5uDtuJLtJpZ9bFSqitgyquKhLqR
	VmX5638ewiJbJRsG/p+dmw07PsEofcmsIQ2rTeaUAK78kgsrkbydYjNjbZT/MyfJCGI54ladc+W0R
	hxgnTtXmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kutOm-0001Nu-LR; Thu, 31 Dec 2020 08:33:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kutOh-0001L3-9Y
 for linux-amlogic@lists.infradead.org; Thu, 31 Dec 2020 08:33:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id g25so3539075wmh.1
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Dec 2020 00:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
 b=iPGHGeVR19yf0873nrpSscXEgUi6czdITxFf9XPnoJ9ABQczW4ok8EEnowhMbWE+RU
 83H9Egp/wsOFoyI0KgnI6TUetGDp2RmqGYnfmjcSh8IhiYc/95wOBL3Ze+nAeK+YEmPU
 30BbdPtfxtt8XqILPZFB4+EzKqmZ8y6T2jSUDbll+sIk2xB71at0b4XQHvfZ9E4NMyoY
 1r9+Vu9dT1US1yuzq/3QCdSwye6xV+yiudh/tO4R1ebQ8XkHxsjfPg+eo/2NQK3j+ELL
 PceYAOI3RTem7iJrRtgKxtYJrkRRJ5OG2EOn/dByp+36RCL1pUkuUKVuRZKNc4nkkVJ5
 JtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
 b=apGK9RulKoEAJw6aiJ9n7OqYAlO5DoN/nSB5nyHWoZrWVl4fTyLWbYByf3/Da+uRRb
 8yl6Pc+IY6Af31eD9PWn5Fub0lXIEqlM36T+3KOsbHNO4EJzqg9hz5goP/SOialbhr2R
 wA8Ms9CtxRcUYY78Gro792eDsoqZ7mnPQoWlVt7LDz/B8F7FmquMaxeCdWy7T2ei6YWa
 9ytbzYDPD8FVP4ahj/eLqb61VIHHdG0dsZQkFizm6Akq4sgmUk5yeysPOcNgbhFvgAdl
 Gj0Z9H/mFpz3ZSX3f8GKCzjv05lEdwjhF34s2Hs8LMcqZ/2LPcJCKyuDcbQuPfKzkrMH
 rnKw==
X-Gm-Message-State: AOAM531Cqc1OX2meYXwXnCJiPOqJIN8QX94EykMcWoebgSJz+8gJWe5M
 vNzkLSzykw7bD6sfqHNvTmcXGw==
X-Google-Smtp-Source: ABdhPJxgVpv6k0MI/BzifwYgB548pcGt6oqlux6TtaOZNi7+9Ao4+rwMet8Sf7IpouJnC+LD4ubqhA==
X-Received: by 2002:a1c:b407:: with SMTP id d7mr11034773wmf.34.1609403601033; 
 Thu, 31 Dec 2020 00:33:21 -0800 (PST)
Received: from dell ([91.110.221.133])
 by smtp.gmail.com with ESMTPSA id z15sm71074287wrv.67.2020.12.31.00.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 00:33:20 -0800 (PST)
Date: Thu, 31 Dec 2020 08:33:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231083317.GB4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230185439.GC25903@duo.ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_033327_667842_041007A6 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAzMCBEZWMgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+IFRo
ZSBub2RlIG5hbWVzIGZvciBkZXZpY2VzIHVzaW5nIHRoZSBwd20tbGVkcyBkcml2ZXIgZm9sbG93
IGEgY2VydGFpbgo+ID4gbmFtaW5nIHNjaGVtZSAobm93KS4gIFBhcmVudCBub2RlIG5hbWUgaXMg
bm90IGVuZm9yY2VkLCBidXQgcmVjb21tZW5kZWQKPiA+IGJ5IERUIHByb2plY3QuCj4gPiAKPiA+
ICAgRFRDICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5l
eGFtcGxlLmR0LnlhbWwKPiA+ICAgQ0hFQ0sgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0LnlhbWwKPiA+IC9ob21lL2FsZXgvYnVpbGQvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5k
dC55YW1sOiBwd21sZWRzOiAncGFuZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhl
czogJ15sZWQoLVswLTlhLWZdKyk/JCcsICdwaW5jdHJsLVswLTldKycKPiA+ICAgICAgICAgRnJv
bSBzY2hlbWE6IC9ob21lL2FsZXgvc3JjL2xpbnV4L2xlZHMvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1wd20ueWFtbAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5kZT4KPiA+IEFja2VkLWJ5OiBKZWZmIExhQnVu
ZHkgPGplZmZAbGFidW5keS5jb20+Cj4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiAKPiBUaGFua3MsIGFwcGxpZWQuCgpTb3JyeSwgd2hhdD8KCkFwcGxpZWQgdG8g
d2hhdCB0cmVlPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
