Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F1ECE587
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KN8VA3j8a43lPYkQOWrGZKiINUxaw10YPbvOLa5o78U=; b=XwwcjtgETIMzSj
	qWdUg7liwjeYKKkRqAI7LgeWUW5456Kor4It5aUJUjQJ0cvvoZFwF8ZvryxZ5MdRe7RlpJo16ua4j
	AFTyMhq7/SqsFnQSCcxZeoX3Rjos3uP2KyA2QyEzJP3sABRIk1eHokwMpK77LTARLKcvxAhxf3oBF
	bvSskE6mAmSsl4l1uGb9oL1BR2b6n0NroNekdSnlhFzxb6MJCrkZniwxrOvDCjd05LugaGnG+5CNt
	cTG9sJ09NSGgdZ4f3q9v76niW7hfwsYcpJ1Ql9blVMUPSHDrRzpHlNzk007/jIH3+eAAbSrQf+Lqk
	iycX3nG4GDnbxSDhbwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snl5z-00000003FX0-2xK1;
	Mon, 09 Sep 2024 20:34:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snl5w-00000003FV3-3LP8
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 20:34:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2057835395aso252085ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1725914084; x=1726518884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcXQezJjSLg5qxVqkCGsM2Pv3JwZXPNffyugX9lgSxw=;
        b=PA1YQNbz7DHRELtnO3d1VVDLEX/yRljsKQvsR9auW2Iu/FwDq1QljmN6DFl24NXwqp
         ua1uguG7l8jEsokiJ6wDPwolfXs0hCPmAxqxQr5+3X5CWOqTQ2aXuAGzIozPQXh55xR6
         9rhbj2AN3Aib/OuY4GqX8ZGEUZOpeItjJgWaSIkk0NhrwIjz02tXLQwS9rK175ivBFxF
         C20sz7Ub06Qe0WANScQhA9o1DgxrcrT68MpUthbqm63P4aFTnfUclybThVcw3pcQ3iCd
         Kt2jdznlnIWGkxBlC1Mzzn7JNWo1aCwmTv2ROwXY6I35S5wK1o+j7iyIsmggLuarNukD
         Dp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725914084; x=1726518884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcXQezJjSLg5qxVqkCGsM2Pv3JwZXPNffyugX9lgSxw=;
        b=QNugPKINqGNfiDrQS5sqfO+Jhf0OSyF1jUfNBhyV5p6U8JhYV7R8q8KrxXm5PdsOQh
         pjeEuOQJ69nNGrhdOO2RnagIr3H3aCytp0yefqqzWwL4+yvlC6r918RvHMcRt7vf+QLS
         hKQBiPylJHhSOWQoJn2x2HbKRIcImBsNA+oyI5vVcfbdYBYA3lLgKkIzJH0XWQdmYtX1
         aDsh6P90Gh82KOZmCQZEMZfyvl8tUtPN0rnZGG3V3zY+n9eoyhSdXqcO6Xdnkg1ewgWy
         FhN7S+hCFskqeau16RPAt6fT3IoPgTmmw+iH99Z3fVEnUWhn1Lh8INc+4UQSQjYOh4YS
         15OQ==
X-Gm-Message-State: AOJu0YyH7FpEY6Hgb/hUjy+O97gL4wbR5D4Ht6wy5ybzh5jS30NE+3Ma
	38E9Xuupe9qE+G7oG4Fa9x/MlpF+u+vrJJY5jhxcDBek246dFEl3rQbOzoI+NpoucVyr7XGw4nG
	VCcilMX69fnH3xE07hbpyeMLOmIc=
X-Google-Smtp-Source: AGHT+IHtjNB9WOD4x2ZtLHd+8P2Uxpkj4YCOVsF3HWCq0J2JW1UcPam0VBkhxYiy0TKztmS3WxTlV8gwYfBBdok/CTw=
X-Received: by 2002:a17:902:d546:b0:207:3fd0:13ec with SMTP id
 d9443c01a7336-2073fd0150cmr16801925ad.17.1725914083750; Mon, 09 Sep 2024
 13:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240905152951.83481-1-theo.debrouwere@faytech.de> <20240905152951.83481-2-theo.debrouwere@faytech.de>
In-Reply-To: <20240905152951.83481-2-theo.debrouwere@faytech.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Sep 2024 22:34:33 +0200
Message-ID: <CAFBinCCbnxMiXtTfVvHKvyqzqwW2uOb_WZDVW8GnVcqXiUNouw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12-common: add pwm_d option
To: Theo Debrouwere <theo.debrouwere@gmail.com>
Cc: linux-amlogic@lists.infradead.org, 
	Theo Debrouwere <theo.debrouwere@faytech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_133444_880715_BE10933F 
X-CRM114-Status: UNSURE (   7.80  )
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

SGkgVGhlbywKCk9uIFRodSwgU2VwIDUsIDIwMjQgYXQgNjo0NuKAr1BNIFRoZW8gRGVicm91d2Vy
ZQo8dGhlby5kZWJyb3V3ZXJlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgUFdNX0QgcGluIG11
eGluZyBmb3IgR1BJT0FfNC4KVHlwaWNhbGx5IHdlIGFkZCB0aGUgcGlucyB0byB0aGUgLmR0c2kg
b25jZSBhIChuZXcpIGJvYXJkLmR0cyByZXF1aXJlcyB0aGVtLgpBcmUgeW91IHBsYW5uaW5nIHRv
IHNlbmQgb3RoZXIgcGF0Y2hlcyB0aGF0IHJlcXVpcmUgdGhpcyBuZXcgcGluIGRlZmluaXRpb24/
CgpEcml2ZXIgc3VwcG9ydCBpcyBpbmRlcGVuZGVudCBvZiB0aGlzIChhcyB3ZSdkIG90aGVyd2lz
ZSBlbmQgdXAgaW4gYQpsb25nIHBhdGNoIGNoYWluIG9mIGJvYXJkcyAtIHJlcXVpcmVzIHBpbnMg
LSByZXF1aXJlcyBkcml2ZXIgY2hhbmdlcyAtCmV2ZXJ5IHRpbWUgd2Ugd2FudCB0byBzdXBwb3J0
IGEgbmV3IG11eCBjb25maWd1cmF0aW9uKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
