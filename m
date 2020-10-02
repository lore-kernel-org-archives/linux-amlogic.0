Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B01C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 15:09:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C176206CA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 15:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yS6ctnRd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jseWkh5p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C176206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YwbMjyrrd4+3odg52U4cUb0ZQjy83XeNcrPe/3c1sCI=; b=yS6ctnRduECFhpJ86dSxVmAIW
	zju8g336lVgLmFsWAIzvMX1Cy/h+anaVr0Yaw0ZLaDxvTNaTEOEYaYFnEj1lPkZqcJRE/PbVyPaD+
	LoH1u5ix3mz0EbUMcFI2w9+NkvD8SyqUnE/zagkB8VDFTFZ88GRusJLInQ3/aqD1ByXoSCLyhQz3N
	KNbL6sMvZploPKu/V89wSzEZFQFKJF0R5XMR4FQ4AOHPAOo6IyIX+aXo3ge1CCgox6bloKuMBV+Ti
	Uh19EaaIXgaKXaJFfLbTWPlHdlavnCFqJ0Z9yALmKbLRuEWiu9iY5xA1DqBZSx5JrdXnK41wdIcjt
	pUoDcuAWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOMgN-0000Ee-Es; Fri, 02 Oct 2020 15:09:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOMgI-0000Cc-4s; Fri, 02 Oct 2020 15:09:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id y15so2122182wmi.0;
 Fri, 02 Oct 2020 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LA4N4jwS0PM24KWIm/8qeSLtdV8HPanZoxEuo3h48PY=;
 b=jseWkh5pBPjazyMAyGSHiMg0Ha+iXNOXhLiD7wDqBFnp9LiCvVd1+moRbGfEqUouCy
 3DOb8O5GzLj1ptgrqS8yUVXNEyQAmmcm4W4N7FhmuGDYUxotP/z4gZgf2xTzFAoNYruL
 Fhsqa+6hB+K8DtgdvyM6UrOY8ruARnsBZqSRZ33GqAkspuUwIKAOQRBvglz6WxSc1dUU
 SA9+KL4vgv4V0C60gFtJSbJJ1Cta92i7waK97HsumCNnv5oBlduFYEw7FcLk/PKZAqx+
 /cP12scpSp/asOpPfxlHNk++S9KISLJO5+TlaDp2SIm9lTdDgwmSd31DqiPoyepORFdD
 1lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LA4N4jwS0PM24KWIm/8qeSLtdV8HPanZoxEuo3h48PY=;
 b=uO3+4pmnOLrr/fv35TOFgq2X1J+qarfbR6N7nR3KwnEFU7k5AnfLsr8q2WRYI/kCHG
 ThfaqL+k2+L25E/6VBvyCwaxs+g2y2uP3h2CH6F5fYfvNZMvwBtTQTxxrCjFwHMFUG1/
 csK12vI7ly3jfAdHDkrBA1dANEiPIPSgBWRU2oLJ9SQ7n0ekQVz2IFy3JicUzwZyIxxY
 lvgEP+TAjvogiDrOVFJYK5f+OQbBVer2ts4aSmzpPvrk+cMMRnioBnKwvzWskD6eTAVl
 dattQGbzRVz5pWBaf2lInLKpJgnOItrtck2BNQId+ezQ2OXe3EGpOnDdcn7xQeYsfXgM
 fEig==
X-Gm-Message-State: AOAM531MLfuP4RV9IzBpW9DSJty9QtKi8iLC/e5u4RN1ux/ZMXmusxq8
 0waRM5o7qDmk0vMEr9gcLyg=
X-Google-Smtp-Source: ABdhPJy1UdAGLpPyCGcyX46dxAc9Yql4f7DxMt0bgH3n4ih/eN2TUqsMYB4u6qexjgTR/Tgu+Axnsg==
X-Received: by 2002:a1c:6341:: with SMTP id x62mr3435509wmb.70.1601651349030; 
 Fri, 02 Oct 2020 08:09:09 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y1sm2126241wma.36.2020.10.02.08.09.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Oct 2020 08:09:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 2 Oct 2020 19:09:05 +0400
Message-Id: <785296E3-FA91-4F5E-A8C0-1FAA8C576A17@gmail.com>
References: <20201002141619.14387-1-christianshewitt@gmail.com>
 <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_110910_251060_BF08B78E 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMiBPY3QgMjAyMCwgYXQgNjo0NCBwbSwgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+IHdyb3RlOgo+IAo+IE9uIEZyaSAwMiBPY3QgMjAyMCBhdCAxNjoxNiwgQ2hyaXN0
aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBWSU0z
TCBub3cgaW5oZXJpdHMgdGhlIHNvdW5kIG5vZGUgZnJvbSB0aGUgVklNMyBjb21tb24gZHRzaSBi
dXQgaXMKPj4gYW4gU00xIGRldmljZSwgc28gbGFiZWwgaXQgYXMgc3VjaCwgYW5kIHN0b3AgdXNl
cnMgYmxhbWluZyBmdXR1cmUKPj4gc3VwcG9ydCBpc3N1ZXMgb24gdGhlIGRpc3Ryby9hcHAgIndy
b25nbHkgZGV0ZWN0aW5nIiB0aGVpciBkZXZpY2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4gLS0tCj4+IGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEta2hhZGFzLXZpbTNsLmR0cyB8IDQgKysr
Kwo+PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+
IGluZGV4IDRiNTE3Y2E3MjA1OS4uZjQ2ZjBlY2MzN2VjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLWtoYWRhcy12aW0zbC5kdHMKPj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+
IEBAIC0zMiw2ICszMiwxMCBAQAo+PiAJCXJlZ3VsYXRvci1ib290LW9uOwo+PiAJCXJlZ3VsYXRv
ci1hbHdheXMtb247Cj4+IAl9Owo+PiArCj4+ICsJc291bmQgewo+PiArCQltb2RlbCA9ICJTTTEt
S0hBREFTLVZJTTNMIjsKPj4gKwl9Owo+IAo+IFRoZSBzb3VuZCBjYXJkIGlzIHRoZSBzYW1lIHNv
IEkgZG9uJ3Qgc2VlIHdoeSB0aGUgc20xIGJvYXJkIHNob3VsZCBoYXZlCj4gYSBkaWZmZXJlbnQg
bmFtZS4gSWYgeW91IGFyZSBub3QgaGFwcHkgd2l0aCB0aGUgbmFtZSwgcGxlYXNlIHVwZGF0ZSBp
dAo+IGluIHRoZSBjb21tb24gZmlsZS4KCkl04oCZcyBhIG5pY2UtdG8taGF2ZSBub3QgYSBtdXN0
LWhhdmUsIGJ1dCB0aGUgY3VycmVudCBMRSBpbWFnZXMgdGhhdCBhcmUKaW4gY2lyY3VsYXRpb24g
dXNlIDUuNyB3aXRoIHRoZSBwcmV2aW91cyBib2FyZC1jb3JyZWN0IG5hbWUgc28gSSB3YXMKbG9v
a2luZyBmb3IgY29udGludWl0eS4gV2UgZG8gc2VlIHVzZXIgZm9ydW0gcmVwb3J0cyAoaW5mcmVx
dWVudCBidXQKcmVjdXJyaW5nKSBvZiB3cm9uZ2x5IGRldGVjdGVkIGhhcmR3YXJlIHdpdGggb3Ro
ZXIgU29DIHBsYXRmb3JtcyB3aGVyZQpzaW1pbGFyIG5hbWUgaW5oZXJpdGFuY2Ugc3VyZmFjZXMg
dGhlIOKAmHdyb25n4oCZIGRldmljZSBuYW1lIGluIEdVSXMsIGFuZApJIGxpa2UgYW55dGhpbmcg
dGhhdCBhdm9pZHMgc3VwcG9ydCB3b3JrLgoKSeKAmWQgc3VnZ2VzdCBLSEFEQVMtVklNMy1WSU0z
TCBhcyBhIGNvbW1vbiBuYW1lLCBidXQgdGhlbiBpdOKAmXMgdGhlIG9ubHkKZGV2aWNlIGluIHRo
ZSBjdXJyZW50IGRldmljZS10cmVlIHNldCB0aGF0IGlzIG5vdCBwcmVmaXhlZCB3aXRoIHRoZSBT
b0MKaWRlbnRpZmllciwgd2hpY2ggKE9DRCkgZmVlbHMgd3JvbmcuCgpDaHJpc3RpYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
