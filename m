Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46250C433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 07:33:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EDA2184D
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 07:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kcaqLoEc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsFHLmxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8EDA2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TtYio96TN0V9RsRlscPdju7NQDul8eeuyI3YgVcEGZ4=; b=kcaqLoEco3CD5Osl0YOAy3qCX
	mKjTWpF1QXL5/A8dyDWmwKDrO+oG8487T3VuN8pCNLB0cLms/9LIB7+VhReGf9yUWJI/NFsLo1iV/
	ruWIluY42R//YVT8COQ489Q9hPruMgjtnOAybRnizAuAFE8+viDf+4WJniiv39VYKLYyHLoa5XcVo
	atR5lRXB3w7KRPFNWdcy/36usr7fcjkYhNeC66jBq+0Ag+j7+LSUcp5TdWN1+FCGD6U3dvmI2RsoK
	Lg3BmwUZO3JfeVnE0FTzARM9r6RRNzxt1TZ96qAksW8JlWi6apb0DBILsWUEbm5P3WV02bPxPw5c9
	rok0cz6fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQQQp-0007Be-BY; Thu, 08 Oct 2020 07:33:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQQQn-0007Ao-25
 for linux-amlogic@lists.infradead.org; Thu, 08 Oct 2020 07:33:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id n15so5404817wrq.2
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2020 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
 b=ZsFHLmxE7BINX3sLNhZmok4EUe+DHyNsoKFxHXdX3XoSP/qHZ6sO4YdEVZnTldhdY7
 26iJvDlQBO5kneSJgq8Ui40Fv99Qfopg22haKLGa7CTGRmxvfG5orLelU4lG2qZiGElE
 dkoMO11L1XEeGCXndx2NoKnjCR9PDvPpU+7dELIvNgPtdPpnwhuLZKm4h4zdb6JXoeU2
 xxWCenu7xveYXeRW/fFuM7i4SAdQdP8Q2EPua1MW2787y1cWhN8CJkWCyic9+GFesKWz
 w+b0z7cnlPzn6cPtmqVDDXtZPtjWeZ8S+kbZJoZdAm8Cdr4W17C7OiYCPMJiNDQuM6GZ
 Y2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
 b=WLabRJN+UvY2XUFFIHEcVEFsLI/P5TIJkEYbvzoFuuDXbKKE0+EROd0sa47q+EkMus
 llOsmC/4B4UwoFS7NwHajRLZOryIIc1PdOI0fZ0Ksr6GLtADnanCpVRXuQDYqJOx8VRZ
 /zCSW+lHEOROzhpmRzWQgbOvtkp3zSflml3p9WZWG+Nm5i5CV80P+lDNzdSAcg+/rFia
 r0un989DKaxNRvLnsy70d7TtwTdipEN7BXYRQ3Epn+TjZ8nyefH8ruQelpc3xXAoL8xt
 zfHx0JXU5VtPEyWK12wXuMbdWXrvzcIrra11KZXJj7KyD3TC6ejO5efeawholHDOULId
 3UQg==
X-Gm-Message-State: AOAM533jK5gJKxE4PtOa0e6wO2omF0J/3AcZIfUcwd5T5TnxbwsCnUiS
 oERYjD/35DWmf9Kz+SNMQtdvOg==
X-Google-Smtp-Source: ABdhPJzabvtfwLmhnEYubgjfeo2bB0aroK/nU1F0zOHh2mrKpbUH4p2gKhjVT7qNDholk5mCIJP9Ag==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr8460241wrq.157.1602142419967; 
 Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Received: from dell ([91.110.221.232])
 by smtp.gmail.com with ESMTPSA id s11sm1385391wrm.56.2020.10.08.00.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Date: Thu, 8 Oct 2020 08:33:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201008073337.GG1763265@dell>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201007100359.GC12224@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_033341_139216_13AC81BA 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwNyBPY3QgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+IFRo
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
bGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5kZT4KPiAKPiBPa2F5LCBzbyBJIG5lZWQgUm9i
J3MgYWNrIGhlcmUsIEkgZ3Vlc3MuLi4gYW5kIHJlc3Qgb2YgdGhlIHNlcmllcyBpcwo+IG5vdCBy
ZWFsbHkgZm9yIG15IHRyZWUuCgpUaGlzIHBhdGNoIGlzIG5vdCBmb3IgeW91ciB0cmVlIGVpdGhl
ci4gOykKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
