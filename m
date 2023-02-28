Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67398C64EC7
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Feb 2023 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVgUN6u7AIahQKYRr37Zy8lf4cPjP479hR4kS3GDkCs=; b=suLlY/Y7mZQ1dZ
	cdVnh/wvAWYOo2Q6LU3gsRubZhRaJQwhUeSikn1HDi/8VUeenoShDcv66SyOx7WR0uNn2yg82cfHN
	BCjmzXbJozMCiho6rkK5uqvo4Xj2roSUpBJ136xxdEI8HHmIeLIwUqtnx7X/Gv+w8FXEwQ2HPazw6
	xku/epOgPm1YPbgSCHGpecRvnEzbvochZKvdy+PSjYNFYoUdPX7FU2B4zR/I4BCFq8/vHviOrYegd
	2o3dyktu3FirtBWeAvJpat7Mw5AxYpLZqBZBCAGcHpytiYPl4UDCpYQSD0XoZ4Qwhz1pCP/khzALX
	/3iwhC7EeOEi2/dvjhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7ql-00ENgy-23; Tue, 28 Feb 2023 21:49:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7qi-00ENgS-7X; Tue, 28 Feb 2023 21:49:29 +0000
Received: by mail-ed1-x534.google.com with SMTP id h16so45979319edz.10;
        Tue, 28 Feb 2023 13:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWJwdboDFMDJES0P7rMKXi/ErKfhzZT8S4SKmV8tFAE=;
        b=RQC5cOpLYLaALSwnl9+qpIC8SuN+TMJX5CJn8aIe4Dz2xpybG19eafffWaYUpBIp4R
         YdpB7B+70ioKyIyCl/TriEBi9gu9xt2ePymy4vg2sUx1MkNJz4yYeJDZIDHAGM3JJNtk
         Qfw+s8x4hX9P/8Rx4gmCfA2rBcva9uaSj+gduAoVOoRlluONeAaPD3v3jB30GcWcnd75
         BmpU4+m4vbmdDBAoZbMI7mHNVI3sfiXX9LQp4tAxohBTgLu64kXEV7a7yVU1elq284It
         B/bTfk/sjB0tGj84BDeSCShBTvqx6gmBjFJ/wlaVUhrFwjIhjwp1I6rj5qmssOon2DFT
         qd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWJwdboDFMDJES0P7rMKXi/ErKfhzZT8S4SKmV8tFAE=;
        b=ObRX8oYRc/mG5sEoPQUZ/onDeE/TggcR58V+pc1y7vZ6wv6urRqtG6Ckf3iMyv/c1z
         T27+AXJL9ACNC8O8ii5O0DU+DcmbuIDuxQlxyQdjuWQAvmIpBDXxPq2t+w0Znqk8FR7k
         6f0JHOszscYj2+AfqvM1CFKQGQX23CocXE24nI36nDPOWpuZIU80IQFnyQo1BAU0Grfn
         kWWKLQgQBW99WiKLpNkbJxtcpLv/fbwb8MLGAu6y3tKLHeymNAFTfVnM7d6nYdkNd8UM
         wHKQtIrkoDE3eqW8BMON/+Ib4R2wz5LDr3EpPPUaxmCGAWZ2F9/HT/DjLMNncyBTJDes
         T3mQ==
X-Gm-Message-State: AO0yUKUIG3O+P9+vvXnJ3Hiqfpc6j242bZtN3woB1QS/jc7iWZotVgwy
	lssK42ghYLxdLFflJVPCDM8cPGPTLgiT53PfykM=
X-Google-Smtp-Source: AK7set9albOpD5Fkbflg5ZQzVoARyCb+d02HolNmv1buirSRXagOHsINOiqDRg/VwQ18SUHG47YerB58X5V86HkFk1Y=
X-Received: by 2002:a50:cc93:0:b0:4ad:7482:cd3b with SMTP id
 q19-20020a50cc93000000b004ad7482cd3bmr2596784edi.6.1677620964941; Tue, 28 Feb
 2023 13:49:24 -0800 (PST)
MIME-Version: 1.0
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr> <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
In-Reply-To: <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 28 Feb 2023 22:49:13 +0100
Message-ID: <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
Subject: Re: Conflict between video-lut and pmu on meson-g12
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: AML <linux-amlogic@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Chris Healy <healych@amazon.com>, Will Deacon <will@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_134928_312491_746303EF 
X-CRM114-Status: GOOD (  14.17  )
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

SGVsbG8gSml1Y2hlbmcgWHUsCgpPbiBUdWUsIEZlYiAyOCwgMjAyMyBhdCAxMDowNOKAr1BNIE1h
cnRpbiBCbHVtZW5zdGluZ2wKPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdy
b3RlOgpbLi4uXQo+ID4gQSBzaW1wbGUgc29sdXRpb24gbWlnaHQgYmUgdG8gc3BlY2lmeSB0aGUg
ImFjdHVhbCIgYmFzZSBvZgo+ID4gdGhlIHJlZ2lzdGVyIHNldCwgYW5kIGNvdW50IGZyb20gMCBp
biB0aGUgZHJpdmVyPwo+IEkgdGhpbmsgeW91ciBmaXggaXMgY29ycmVjdCAoZm9ybWFsbHkgaXQg
d291bGQgbmVlZCB0byBiZSBzcGxpdCBpbnRvIGEKPiBkcml2ZXIgYW5kIGEgLmR0c2kgcGF0Y2gg
LSBidXQgbGV0J3MgZG8gdGhpbmdzIHN0ZXAgYnkgc3RlcCkuCldoaWxlIHRoaW5raW5nIG1vcmUg
YWJvdXQgdGhpcyAtIEkgdGhpbmsgdGhlIHdob2xlIC5kdHNpIGNvZGUgc2hvdWxkCmJlIGltcHJv
dmVkLiBCb3RoIG9mIHRoZSBQTVUgSU8gcmVnaW9ucyBhcmUgcGFydCBvZiB0aGUgJmRtYyByZWdp
b24uClNvIEkgdGhpbmsgJnBtdSBzaG91bGQgYmUgbW92ZWQgaW5zaWRlICZkbWMgKHdpdGggdGhl
IG9mZnNldHMgYWRqdXN0ZWQKYWNjb3JkaW5nbHkgb2YgY291cnNlKS4KCkFsc28gSSB0aGluayB0
aGUgZHQtYmluZGluZ3MgYXJlIGluY29tcGxldGU6IGFjY29yZGluZyB0byB0aGUgZHJpdmVyCmNv
ZGUgd2UncmUgdXNpbmcgWFRBTCBhcyBpbnB1dCBjbG9jay4KQnV0IHRoaXMgaXMgbm90IGRlc2Ny
aWJlZCBhbnl3aGVyZSBpbiB0aGUgZHQtYmluZGluZ3MuCmR0LWJpbmRpbmdzIHNob3VsZCBhbHdh
eXMgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLiBUaGUgZHJpdmVyIGNhbiBkZWNpZGUKbm90IHRvIHVz
ZSBpdCBidXQgdGhlIGJpbmRpbmdzIG11c3QgYWx3YXlzIGJlIGNvbXBsZXRlLgpBbmQgd2l0aCB0
aGlzIGNvbWVzIHRoZSBxdWVzdGlvbjogaXMgdGhlIERNQyBQTEwgc3BlY2lmaWMgdG8gdGhlIFBN
VQpvciBpcyBpdCBzaGFyZWQgd2l0aCBzb21ldGhpbmcgZWxzZSAoZS5nLiB0aGUgYWN0dWFsIG1l
bW9yeQpjb250cm9sbGVyKT8gT24gdGhlIDMyLWJpdCBTb0NzIChNZXNvbjhiL1M4MDUgZm9yIGV4
YW1wbGUpIHRoZXJlJ3MgYQp3aG9sZSBERFIgY2xvY2sgY29udHJvbGxlciAodXNlZCBieSB0aGUg
RERSIG1lbW9yeSBjb250cm9sbGVyKSwgc28gSSdtCndvbmRlcmluZyBpZiB0aGVzZSBuZXdlciBT
b0NzIGFyZSBzdGlsbCBmb2xsb3dpbmcgdGhhdCBhcHByb2FjaC4KCgpCZXN0IHJlZ2FyZHMsCk1h
cnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
