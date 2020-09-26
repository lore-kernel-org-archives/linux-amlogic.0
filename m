Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EE3C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 07:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E622080C
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 07:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nk6Een6m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2qZB5X/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E622080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0kaTDQ6TOVqlwy9biwoCapkJCVKZ8EegA+ECJ2DmeM=; b=nk6Een6mPLi1PfqQh2qjPbTsqB
	3lJIo8+a43O1lTWJADDY4eksFgvTWAr2MmC6+kAHHoiKKe3vy8zhRa7fgbE/PHYoDglaZ222ZBH4L
	R+0NrKPABxIvFB09L7/b8j9h9wq5Zsaea4AloGzC/Nplfj4lh/fPLrafsiNSHUZcCqEe7vJ45Vg/H
	4nzTTaClLeq4yDneWV2KmxgTuvRL5qwoh0+TWLG89FjpCILuzN5+fPuLo49xeDPKRVKfHQPUnUP7J
	iDbqsCwj4RNlPDhGGjbOJ2T4+WeqD+NJrKhssmiN/ISwtV/VZk4fFTDIpvveEm/dkjyjJ3f08/XNV
	+pstFYNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM53c-0000MN-Nc; Sat, 26 Sep 2020 07:55:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM53Z-0000Lp-C7
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 07:55:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id d4so1482131wmd.5
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=pTA0hmsHcNqtI2fDLdRBHiVrah9nomJTQoK+wEwr798=;
 b=M2qZB5X/m3H5K3GEzXLTtYtmeCpkv+I2oOf9AfMMhw2L9ostZgECSYCShrtjuYCzIZ
 tlmSRnhVu6LS1IgqHXUvxO8GpNH3K5fhLNufRbT7TaLfL+ZzhDdpl0ZowGuzdiZ5KcIJ
 DMbjGNXpgT4Ltq8aeuPlijaf8B/J8njbPYCBga1UcGM1MsRsF828mrY46juXbG54J/5K
 9AwRIqswp+Cfj5u6jAWuZyK+NR+9REsWvUwXQQ3K9b2v0MxZHY/A7y6mgOk8dviU6vT+
 p+nP92EHVn90ZVo3F/eg7TVPJXwU2cUJMT7c/0to1OSysbh6p1yhR6VbsGeXqwgnjcOU
 Lh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=pTA0hmsHcNqtI2fDLdRBHiVrah9nomJTQoK+wEwr798=;
 b=e095RHlvCdGMo5xoMJOmpnNc79QYpfYxrRjhQO77LCWQ6Uu7FAVrFuNZNbHBd/EO+y
 r63s1YLnl9WswTEQ4mCj6KeMDMCeRz7uUlIZS0vwa/+W+26dkUlB0UwTyL4L6f9mmadW
 6RTF1JSVrU5a/OK0HQSetuV4FjaPNWgxa1v28EdYNm6OILHbmeGTEJ/LhyDd0WDYiW5v
 qU4y0gv+Q4pEaF2iLy82p0tCLgXlNJItX3WfBwU5uyzwYE/gcCxHqiLOQXlV4QFJMIFo
 IT3N/bhwT7lwB0qTuoKIJ4Yrk8uDuDE62gaGyFL0ZPDXzW1TY6D/hbIA0LbpobpdLQZg
 tZ3g==
X-Gm-Message-State: AOAM53031gBbf0vxS9lIYtfohbTdFUEPdwgoYU4yJ5lZfEkiR+dU32Zw
 opYCAj9WVohYuOZUq6rpp1Y=
X-Google-Smtp-Source: ABdhPJxN2sf8T0c2574PbIWh7ZWRVLX9R78jkbwc5JkiNrZ7OZvOcpuA3qjy4kdEL2QUwiCZ+bimbA==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr1464744wmj.171.1601106942638; 
 Sat, 26 Sep 2020 00:55:42 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r206sm1735863wma.47.2020.09.26.00.55.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Sep 2020 00:55:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Deadlock under load with Linux 5.9 and other recent kernels
Message-Id: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
Date: Sat, 26 Sep 2020 11:55:39 +0400
To: linux-block@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_035545_433096_23B8FF41 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: furkan@fkardame.com, Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSBhbSB1c2luZyBhbiBBUk0gU0JDIGRldmljZSB3aXRoIEFtbG9naWMgUzkyMlggY2hpcCAoQmVl
bGluayBHUy1LaW5nLVgsIGFuIEFuZHJvaWQgU1RCKSB0byBib290IHRoZSBLb2RpIG1lZGlhY2Vu
dHJlIGRpc3RybyBMaWJyZUVMRUMgKHdoaWNoIEkgd29yayBvbikgYWx0aG91Z2ggdGhlIGlzc3Vl
IGlzIGFsc28gcmVwcm9kdWNpYmxlIHdpdGggTWFuamFybyBhbmQgQXJtYmlhbiBvbiB0aGUgc2Ft
ZSBoYXJkd2FyZSwgYW5kIHdpdGggdGhlIEdULUtpbmcgYW5kIEdULUtpbmcgUHJvIGRldmljZXMg
ZnJvbSB0aGUgc2FtZSB2ZW5kb3IgLSBhbGwgdGhyZWUgZGV2aWNlcyBhcmUgdXNpbmcgYSBjb21t
b24gZHRzaToKCmh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01
LjktaW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3NraW5nLXgu
ZHRzCmh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50
ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3RraW5nLXByby5kdHMK
aHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvbGludXgvYmxvYi9hbWxvZ2ljLTUuOS1pbnRlZy9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1ndGtpbmcuZHRzCmh0dHBzOi8v
Z2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItdzQwMC5kdHNpCgpJIGhhdmUgc2NoZW1hdGlj
cyBmb3IgdGhlIGRldmljZXMsIGJ1dCBjYW4gb25seSBzaGFyZSB0aG9zZSBwcml2YXRlbHkgb24g
cmVxdWVzdC4KCkZvciB0ZXN0aW5nIEkgYW0gYm9vdGluZyBMaWJyZUVMRUMgZnJvbSBTRCBjYXJk
LiBUaGUgYm94IGhhcyBhIDRUQiBTQVRBIGRyaXZlIGludGVybmFsbHkgY29ubmVjdGVkIHdpdGgg
YSBVU0IgPiBTQVRBIGJyaWRnZSwgc2VlIGRtZXNnOiBodHRwOi8vaXguaW8vMnlMaCBhbmQgSSBj
b25uZWN0IGEgVVNCIHN0aWNrIHdpdGggYSA0R0IgSVNPIGZpbGUgdGhhdCBJIGNvcHkgdG8gdGhl
IGludGVybmFsIFNBVEEgZHJpdmUuIFdpdGhpbiAxMC0yMCBzZWNvbmRzIG9mIHN0YXJ0aW5nIHRo
ZSBjb3B5IHRoZSBib3ggZGVhZGxvY2tzIG5lZWRpbmcgYSBoYXJkIHBvd2VyIGN5Y2xlIHRvIHJl
Y292ZXIuIFRoZSB0aW1pbmcgb2YgdGhlIGRlYWRsb2NrIGlzIHZhcmlhYmxlIGJ1dCB0aGUgZGV2
aWNlIF9hbHdheXNfIGRlYWRsb2Nrcy4gQWx0aG91Z2ggSSBhbSB1c2luZyBhIHNpbXBsZSBjb3B5
IHVzZS1jYXNlLCB0aGVyZSBhcmUgc2ltaWxhciByZXBvcnRzIGluIEFybWJpYW4gZm9ydW1zIHBl
cmZvcm1pbmcgdGFza3MgbGlrZSBpbnN0YWxscy91cGRhdGVzIHRoYXQgaW52b2x2ZSBJL08gbG9h
ZHMuCgpGb2xsb3dpbmcgYWR2aWNlIGluIHRoZSAjbGludXgtYW1sb2dpYyBJUkMgY2hhbm5lbCBJ
IGFkZGVkIENPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SIGFuZCBDT05GSUdfREVURUNUX0hVTkdf
VEFTSyBhbmQgd2FzIGFibGUgdG8gZ2V0IG91dHB1dCBvbiB0aGUgSERNSSBzY3JlZW4gKGl0IGlz
IG5vdCBwb3NzaWJsZSB0byBjb25uZWN0IHRvIFVBUlQgcGlucyB3aXRob3V0IGRlc3Ryb3lpbmcg
dGhlIGJveCBjYXNlKS4gSWYgeW91IGFkdmFuY2UgdGhlIGZvbGxvd2luZyB2aWRlbyBmcmFtZSBi
eSBmcmFtZSBpbiBWTEMgeW91IGNhbiBzZWUgdGhlIG91dHB1dDoKCmh0dHBzOi8vd3d3LmRyb3Bi
b3guY29tL3Mva2x2Y2l6aW04Y3M1bHplL2xvY2t1cF9jbGlwLm1vdj9kbD0wCgpJIGFtIG5vdCBh
IGNvZGluZyBkZXZlbG9wZXIgc28gdGhlIG91dHB1dCBkb2VzbuKAmXQgbWVhbiBtdWNoIHRvIG1l
LCBidXQgSSBhbSBoYXBweSB0byBmb2xsb3cgZ3VpZGFuY2Ugb3IgaW5zdGFsbCBwYXRjaGVzIHRv
IGdldCBtb3JlIG91dHB1dCBvciB0ZXN0IHRoaW5ncy4KCkNocmlzdGlhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
