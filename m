Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8684CCD193
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Oct 2025 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCM++8xm1Otu3HGg/6GXGqDL268n1FZTIj0WgLBQifg=; b=NPfO7nt2kfS/21
	9LMsyZGFwbQPpkJ0sAKMTZQtl511ekB2ehT17+ZeIMo6Beb5dLKUBvvmf+IcHc4ZGqGomj4RQ7KgV
	4274eKyvHA2Mif+9BlbI2R0d7Yk+NvDL1O+Yz7C/ziowGvB3k2s0NlV1btmNXmqkfjM1lHigGXNd6
	7OqnmQ3lKnWWYMlvdScNPL2OqNkGzRUk+pQI7eWPLLXBIB4IjpY3X12K4LXAI3j7BwuZW3UtxTi9g
	ueL/WIFVSM1FiKMhar2QjBGRQvjrmAbJq9+CrN5yvCq1rBC6n1hbqTMax1Dgxf/HyxIPSOWY79EGo
	SyIv9rLfP+IfgEULDDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90F8-00000001V1U-3jqK;
	Wed, 15 Oct 2025 12:04:34 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90F6-00000001Uz2-07Io
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Oct 2025 12:04:34 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-87808473c3bso1176155885a.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Oct 2025 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529871; x=1761134671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=OPT5UA0OlOZZ50ueWhh5l/U1tmbQ+pAxTu2hguKgLLE5443ScxsK1meXXxsGPav9UL
         ZuqS8weG/P+ebkn7Rkh42W1i87Q5+BJDfGCP+ud2Q/oqIol9vmVxaz8Bp3TuyQafqb2+
         gG3L7WLqBMZo34M/dSoe+WXsL9sIziNaB/n7sVD+n1/6hdRnApFJemt1yddSHTHKP6qp
         I1OzdLd/p6iNEYRei42SL+PuAMyUTPID0GBTpOfHFut5z8v6DR3AwcEsdt1nndTkzyYT
         WuRwQN6gZIOwo5n+GbvCiPBE8Y8Wkg9Lkzz2HPY2obR+e31X1i91k/N98NYRWUpwDqr2
         pzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529871; x=1761134671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=Ed20rSz+Bt6RuLQ1UrXPdW7az4g4W9iBh3aESwLimOAmDKtvQkoW9RV8TrSdPDdXBg
         dYzOmkkRdsK+mCU+d9HhbA/FpV4Umaes+WJtpt0zFbkbt7WPLFLQY/bY0W9iBkeje7NW
         KFlIxpORMcIrs6cTf0DocMq/MsNFEKkRLsiaAPOGrkBGeNmWHalscq4nFP3qCTTkCD2Y
         YyjZJeqvmei4mIGI2ywmd2RPwKEYpo4kiQ54OklzKeG2pwkUOMMFvi/txlIc83Ajf53Z
         nAnhMl97KK8CG7SnnAWqihfyqVMp4E1wepqQsfFbu58tPfBp7GuBWRbEbRk3IEFtghDA
         fqnA==
X-Forwarded-Encrypted: i=1; AJvYcCVEFOIJTZeIKouRNSta04evWSWmCfUWynf5q0mu2lUOYrmv3+4YfsLeyeF7cpMIU2HKQUnl8Sjsk4DyMeZu@lists.infradead.org
X-Gm-Message-State: AOJu0YzxOs57yj83LPvgslHHkR5IxtGGLfsH+q64MQRdX4CryJ2mXTqN
	ITgJixlLvVVien46mAmJS/v1DHUGDhNdPQejkOABYtBCfq8OOH7prls3pnVbZo5O1U+fDNd7KE3
	kn61QWViTyUO3b6KWlF+OGwTqN4qHkDeIcxu4Gze8Lg==
X-Gm-Gg: ASbGncstf19mwwIkgNP0Omkv5yPFGqqcheLE8KgDEPpkB9ejYbDYzKpNjy2C7zhMqF3
	mj7IZ+aFFLGw7mEbhEoT2E4/GdmNaDdrK3NI/ZGV/7/gnK1EEkF4URtZMRJn3Si49K+PuFMKteO
	Jf6zE09ZnutvNs2n+0iL030rE06+jBAC1HcsWjfYrnRC7h6nd4Z1Eip9WmRPl231IjusznRVJwO
	4mL5X7usHPIv+5FOLmlQYHPTiWW89F+Lw==
X-Google-Smtp-Source: AGHT+IGsy4ghNUujV8ICs5xCd3l4JFRIFi1WBGAyKhaZaEA9CMFYjjgZCN0vS1WL/9stf48sqTR9sa0kj6mJ0PU2Rkg=
X-Received: by 2002:a05:620a:800b:b0:85b:5fdf:69ef with SMTP id
 af79cd13be357-883524cb7c1mr3776426285a.30.1760529870781; Wed, 15 Oct 2025
 05:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251013060212.14583-1-vignesh.raman@collabora.com>
In-Reply-To: <20251013060212.14583-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:04:18 +0100
X-Gm-Features: AS18NWBrg_BqO2tS4RN_x8d2btqMDE8us2R2sNEBkP2IYKjicDOGCIjh3Jp7IkM
Message-ID: <CAPj87rPDppYBRuQ99mh=VqrsSErGKcw-ZRY+zPuGrDj77G5k6Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: disable broken MR check in sanity job
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_050432_078975_663293B5 
X-CRM114-Status: UNSURE (   6.04  )
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

SGkgVmlnbmVzaCwKCk9uIE1vbiwgMTMgT2N0IDIwMjUgYXQgMDc6MDIsIFZpZ25lc2ggUmFtYW4g
PHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gR2l0TGFiIHJlY2VudGx5IGNo
YW5nZWQgdGhlIHJlcXVpcmVkIHBlcm1pc3Npb25zIGZvciB0aGUKPiBhcmUtZGV2ZWxvcGVycy1h
bGxvd2VkLXRvLXB1c2gtdG8tbXktTVIgY2hlY2s6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2ZyZWVkZXNrdG9wL2NpLXRlbXBsYXRlcy8tL2lzc3Vlcy84MQo+Cj4gVW50aWwgdGhh
dOKAmXMgcmVzb2x2ZWQsIGRpc2FibGUgdGhlIGNoZWNrIC0gaXTigJlzIG1vc3RseSBvYnNvbGV0
ZSBhbnl3YXkuCj4KPiBCYXNlZCBvbiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVz
YS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMzc3ODIKClRoYW5rcyBmb3IgZml4aW5nIHRoaXMuCgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+CgpDaGVlcnMs
CkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
