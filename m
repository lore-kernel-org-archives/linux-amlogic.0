Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF3EC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 12:18:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A105720782
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 12:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A105720782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGgYCOc8TWanS8HfyZ9C3AhBp4yeYN372UDNbRwu7RI=; b=YYxVNXjSrmTi+PO3GgEMODWCG
	3cxLYiis29TRYvFuHcYxicwuQCdDh4+KoaOdBmt40Ugn6dCTBmCrjU5yFeoVSoQ3SttG3aZ5yWAeO
	CooC/FmOO2JiTvVhniFxFcnRMP45ZFO+XuQgtCJ/8AMLuzyto4ZY+W74KZYNOFBn6UaAh7O8X6W3V
	/u5g4CX4DLPVO7nqYpwidpdO3VdpfEewkJQ5u4RY0a+OUUBlgGMB6hDq0DgYVeCbqjC4K2PmSmXCt
	W5Ccei2RLbe9pR4fPdYSnjHOaiTPIF/c8MYst/1xACswxhe0Jjkn7HNn8MRqA/P/eOGh4G5vGVHPH
	mVzSiCVNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuwuD-00033M-Ov; Thu, 31 Dec 2020 12:18:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuwu8-00030J-CP
 for linux-amlogic@lists.infradead.org; Thu, 31 Dec 2020 12:18:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id c124so7208230wma.5
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Dec 2020 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
 b=F0Ty4zFCDW5DJIvU7G6DHJocno5RtfsBgnYkYnGMSK88ObGi0268Fnw/DLUJdepaxW
 A6ZQM3J5FWnOBndRIGfHhgmNDZ8q4i3o5tf84GZU3fndsYVjgVqrCelSI1OkFUpHDDV3
 OG9x14ceTTBlV+ytPQUQywLl0XlZMZvNir9NDn8eLY69sZY2NRW3Q7u+rIsAJ0/zRxGm
 E4uhdTVSWJSPn2/ljRClFbQZ4B/9efeoO1O8+hCOTBZEjGOgaQwN8E7EGQEPNITYr81Z
 qBQZdcB+FgEMd4ZvsrgDxCWat9IM7yeyBuU0v5X9ow3No6WxvbHtTKgq+G4vcCsHcGZK
 8QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
 b=s92fv7wicqUbRfCVVlLWnJFD7kf/QhMPocRrAMXsCagZ4di/VXyLbIrJ1prKvq3C2r
 qySqnZ9tCgujDwlqza90KS5lzoTIpG+/xbVWw5FNU8yecGzfsJlXsvLPEN52gjIvPXLt
 Y5IGgDfw6sw9HYR5QAcYC16SshGp504QFkfcMXxGAYYkVpm/+0N0geXXqGgf6X9oA9aG
 BQouIFjJp22N5ZVtOfB5sIViXiH7m88BZqSxYfT1LZj8rN3Gr70R2hNTJZh4lNY7kOe2
 RgrfP/sJNa8zULnZPwn/ojYDX7xT/GVGTLOaphZ6dASeyt8r1l08ckJKJr9O3QS5JsfD
 tm9g==
X-Gm-Message-State: AOAM5306QWm6spVP03j/iWnnubsiVBMz4Lk4URfBbL9jFuVhwhXVc9WP
 Oi6jvQH3WSwIYaRqRAoZ1W101A==
X-Google-Smtp-Source: ABdhPJyZpFCcTny/kpxj+lNXYT/J5a5zwnln/azNAkSLIx5BERCKXlTb9EROUOzJtMiXDd6c5BrYzg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr11923999wmh.185.1609417086646; 
 Thu, 31 Dec 2020 04:18:06 -0800 (PST)
Received: from dell ([91.110.221.133])
 by smtp.gmail.com with ESMTPSA id a62sm12743892wmf.7.2020.12.31.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 04:18:05 -0800 (PST)
Date: Thu, 31 Dec 2020 12:18:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Message-ID: <20201231121803.GC4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz> <20201231083317.GB4413@dell>
 <20201231093945.GA22962@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201231093945.GA22962@amd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_071808_768174_D17E84B2 
X-CRM114-Status: GOOD (  14.40  )
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

T24gVGh1LCAzMSBEZWMgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+ID4g
PiBUaGUgbm9kZSBuYW1lcyBmb3IgZGV2aWNlcyB1c2luZyB0aGUgcHdtLWxlZHMgZHJpdmVyIGZv
bGxvdyBhIGNlcnRhaW4KPiA+ID4gPiBuYW1pbmcgc2NoZW1lIChub3cpLiAgUGFyZW50IG5vZGUg
bmFtZSBpcyBub3QgZW5mb3JjZWQsIGJ1dCByZWNvbW1lbmRlZAo+ID4gPiA+IGJ5IERUIHByb2pl
Y3QuCj4gPiA+ID4gCj4gPiA+ID4gICBEVEMgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gPiA+ICAgQ0hFQ0sgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0LnlhbWwK
PiA+ID4gPiAvaG9tZS9hbGV4L2J1aWxkL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbDogcHdtbGVkczogJ3BhbmVsJyBkb2Vz
IG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdebGVkKC1bMC05YS1mXSspPyQnLCAncGlu
Y3RybC1bMC05XSsnCj4gPiA+ID4gICAgICAgICBGcm9tIHNjaGVtYTogL2hvbWUvYWxleC9zcmMv
bGludXgvbGVkcy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3
bS55YW1sCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPHBv
c3RAbGVzcG9ja3kuZGU+Cj4gPiA+ID4gQWNrZWQtYnk6IEplZmYgTGFCdW5keSA8amVmZkBsYWJ1
bmR5LmNvbT4KPiA+ID4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
PiA+ID4gCj4gPiA+IFRoYW5rcywgYXBwbGllZC4KPiA+IAo+ID4gU29ycnksIHdoYXQ/Cj4gPiAK
PiA+IEFwcGxpZWQgdG8gd2hhdCB0cmVlPwo+IAo+IEkgdG9vayBpdCB0byAobG9jYWwgY29weSkg
b2YgbGVkcy1uZXh0IHRyZWUgb24uIEJ1dCBub3cgSSByZWFsaXNlZCBpdAo+IGlzIG1mZCwgbm90
IGEgTEVEIHBhdGNoLCBzbyBJIHVuZG9uZSB0aGF0LiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4K
PiAKPiBBbnl3YXksIHBhdGNoIHN0aWxsIGxvb2tzIGdvb2QgdG8gbWU6Cj4gCj4gQWNrZWQtYnk6
IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgoKVGhhbmtzIFBhdmVsLgoKSSBwbGFuIG9uIHRh
a2luZyB0aGlzIG5leHQgd2Vlay4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
