Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4281ACF649D
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Sep 2024 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z852iIBNrURF3ZysappPC8BLPMwINf3pZaLDvUABMCE=; b=KS9O8ljapCuWcS
	lQnLg3vhiKdMiH6THyoYDQrZG0pTjYbD2T8dDS4zRSEZatlrPrcFQrPq5THCkWEaqOaMrZyJ8uYOx
	3A97MhzlBWxEaKrSQZiFdAsoEMrN+jwF9lG2Mk9YJXyFgA5lx9Px8kKrI8n/fX+1Ai7XJN+u3q4/g
	sZ1FxI8CKP0Q/MPvst4b8KrJQfoUcO2rfeJDnrZiLeIt6qoyI03gtTR3JhdAqIRN9rPnveOZcs0Cz
	Bbk938D5qaQHclyNUwFSBtg2GVUBQ3n0N0zW5J9aDkuqKdSKHGmixaqT2UDTlR4m9zl4w4lxijXgJ
	0P70nuZesL5Y1FedAm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1susj3-0000000Eivq-2kZ0;
	Sun, 29 Sep 2024 12:08:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sushq-0000000Eipu-1tYW;
	Sun, 29 Sep 2024 12:07:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20b5affde14so7782195ad.3;
        Sun, 29 Sep 2024 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727611637; x=1728216437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=UiynhWGqwQA3tp0uNvYwsgKp6JoIGsgQDRHCvgYIt2VxJdypsPjz+U7QUmlFLkEkH7
         Gia0vtvWcr34ZFw5jkNhMbACw1CET2jm1T3/HXvuWcBPFfJanilPuUW16wjEeifdqm+Z
         pJtx6yb6j8V++EX3ZTxV+OZgSUTlhgggrucxv4yDuBLM3DJzvuG6L7pOoDx1Tf5nswjm
         d2l3HSuSm/1PAylmDp25ZcMFtw6G5ZuvvJV0MkvHBOyhdL/X8e0w9UG4ZXapQsgzD+Be
         0o/qviFit5934YuOx+X+J09yOLCDJe/B4O+TTxENKKVLzyUSAHBJXR5DNZOafA0lfe8I
         eqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727611637; x=1728216437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=vWwqaCa1yhgyLoDJjK3fOyxChj06nSTZWBFyeoYT6LJBvR1ZFKeGxr7djhLmv0KB1c
         VmU4/ke8FJP2VbQtLGBLR0gx+8+kkF7qrva/WmWSKN82kEBE9Hwc7sy9DBGL5bHaJt3w
         3eoJ6n/A21y6cX/WjdmqWj/puLaUjp9LIqxqujMAeyo0RIHxXd8EfR22pcaekM/AiBx8
         Zmd2PIx/3BVgWvhk5fLlmUssYKvMCv3f6OAWxqTxRiSjDosniDDqoh9kirexbQx7JsmX
         3g7VFGFpkpjiN47aWSFWLeUN6HMdCSJHJ3eKXnlUmyg++lE1FQ+pz4MxjXbvK3h9+ggl
         cLaA==
X-Forwarded-Encrypted: i=1; AJvYcCWidEJQwNxbgrl4pTrQabQINmGf9/d/XGEeUHPi+KNCHzr0zJFf9a2TeEj0gOuIMvT00CSPmMgvMnsu5F6m2UUJ1g==@lists.infradead.org, AJvYcCXeF2kA9exarkHobajLP1FDFRGmLMXd5p1oaPz7nhEuL3S/0o4oYimDJsgTt6KIvo7tude9Wp+jIsAer/Dy@lists.infradead.org
X-Gm-Message-State: AOJu0YwdtKgvvOZ33yuKYoEgNfXtNSP7ZnLAbyXTS/k8gL97gs0o7T1g
	rZw8TUg5uc7iFlM0BCW3GskH4h1nje5YLsiB5HVeXerOeXYkf0QhytWQIRl2oeF6yK6y3FLdLDA
	r+1TjHZjOF/hfV6iPswMtnw4TmOL6sXTt
X-Google-Smtp-Source: AGHT+IGkItVurXd3ky7Ze3/m8wpVZ4KRuguynlrG29y9ctBKfpIWygc9BxUDQ0/p6z4xHmFc2bL685GfGWj5pSZ1VkI=
X-Received: by 2002:a17:902:d4c2:b0:207:13a3:a896 with SMTP id
 d9443c01a7336-20b369d605fmr122281315ad.23.1727611636800; Sun, 29 Sep 2024
 05:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240929093418.526901-1-yujiaoliang@vivo.com>
In-Reply-To: <20240929093418.526901-1-yujiaoliang@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 Sep 2024 14:07:05 +0200
Message-ID: <CAFBinCBYd2W8+-oKVayFmW9sEVU0Sp+vtW7QNABdsm1Rxh=Y=A@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Fix typos in comments across various files
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-msm@vger.kernel.org, opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_050718_535068_D1D75054 
X-CRM114-Status: UNSURE (   9.14  )
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

T24gU3VuLCBTZXAgMjksIDIwMjQgYXQgMTE6NTLigK9BTSBZdSBKaWFvbGlhbmcgPHl1amlhb2xp
YW5nQHZpdm8uY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggY29ycmVjdHMgc2V2ZXJhbCB0eXBv
cyBpbiBjb21tZW50cyB3aXRoaW4gdGhlIG1tYy9ob3N0Cj4gZGlyZWN0b3J5LiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMgYXJlIGludHJvZHVjZWQsIG9ubHkgY29tbWVudAo+IGltcHJvdmVtZW50cyBm
b3IgYmV0dGVyIHJlYWRhYmlsaXR5Lgo+Cj4gRGV0ZWN0ZWQgdXNpbmcgY29kZXNwZWxsLgo+Cj4g
U2lnbmVkLW9mZi1ieTogWXUgSmlhb2xpYW5nIDx5dWppYW9saWFuZ0B2aXZvLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tbWMvaG9zdC9hdG1lbC1tY2kuYyAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9t
bWMvaG9zdC9hdTF4bW1jLmMgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9jYXZp
dW0tb2N0ZW9uLmMgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMuYyAgICAgICAg
ICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyAgICB8IDIgKy0KZm9y
IG1lc29uLWd4LW1tYzoKUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
