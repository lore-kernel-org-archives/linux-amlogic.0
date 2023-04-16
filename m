Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33761C77B73
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgfHBfvnm9YSwHXp22k7i4wx2jIFDO7kUVNKFFLdFXg=; b=yux/5G+7Q4Dsjt
	oMu3vOwpoMkGfoPvXW3Cmp9ROWglm9ckiogUKVjMCyMEj/zWQCDEjp+Yk2gwvgZ1gCKYm1mz9QkyD
	R8ulr/xZodQnEhj2y70bwL1h8MLAnbtGUymA1d0FfDxRE04W3P3BcEIRdkPDhRv98d0UsVSj0DcKs
	DAkWCRfAxTpFUsEij3ce/5oTFT1xPx8LJumxbx02PL0Fo6oQvrSK15uexCi6ldzbT3eRNAgQwP2XN
	nXtaJDmB/aWEwxZBqFVeTcNThJeolK4z0osOhs/+Y/6KDrZqQzPOh2zqaeKrCEjOss7YO07gkJKH8
	dqRvyN7W75PmbT+ZDsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po9OO-00EQSB-16;
	Sun, 16 Apr 2023 20:54:36 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po9OK-00EQRS-04;
	Sun, 16 Apr 2023 20:54:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so2633319a12.1;
        Sun, 16 Apr 2023 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681678469; x=1684270469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbqqVNzGOI+hATtCpzlQ1GOtPA5LF8eMW+rUvuU9Sis=;
        b=TY2up1IYzC8pjZvMdhx8eGtZx/BaBmT6yhycBCle914vb88iVlSIX31toGZszNqfBv
         DMzb8mC/rJX2a13NTyle/+iZulh5ackAEtZ9yLFKnkxgOxIZ74okVbBqVMKqttLOvDur
         XlkAwWbN2It3I8a5YrWmi3wjCGgz5QOvV6KbhHH9lhyykINsDiMI62OlCT3lhkQlyTWE
         wZYF6WBs9Yr/rb/b3oalu9sGQ3zjKSBYhi4hUQLwco10DvQTSznmTjVI/bURYb6+dxJy
         dqGjy93kRj9LaWw4ZHMiaSQciPOsm8z8yP1v3BSM8Rr3RdOiq3okVzoygrqRogv+XFy1
         mhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681678469; x=1684270469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbqqVNzGOI+hATtCpzlQ1GOtPA5LF8eMW+rUvuU9Sis=;
        b=VRnR7TCADr15gWIzIhP6N8c+ZsnWLFKaAbEj29nBSWLN3S6ddxCVZWt7m2M1jcJez9
         ZGvg/tJAxDxfBy9GIp2LLrTAAiPTiPt1odUa6vSQphHoPYPwO+XxFmM8x5VvHrMVk8Vu
         bLMfTOPGidWsxJKZ5c/edI40qb1Vw7/bH3VnXRlUDoDWMd5uslGDOIM+59qaWiaVJ67P
         PBnQ7WrYATh6UOmoWexSKSRzgp/cUhliamTwF0V1c5rDzAMCXhBv6znTu41Cuiyjx6Nz
         TRb60llljkE5kRxUOsd3rxg45Rc0rH1Sim/sT3wXCXa78vdW54uzBoDkOwbXAVTULNd7
         g+Bw==
X-Gm-Message-State: AAQBX9d861iNOj6BEMUZbaWIhOuzM0RiwGDhCCnKUrR6njpwRx0C9OGY
	sr6S/qZXSUyRnDW9m10EZhSf645ClOlEhAlxmk8=
X-Google-Smtp-Source: AKy350a9ZFr+WU3lXgqd6D7Ofo/EcQzK8HMKPpoXrZ6yJzickE0bYDDssYGK2YB94LQPzTqzkAKIWukx+kidRq69yb0=
X-Received: by 2002:aa7:c414:0:b0:506:7d3e:ade1 with SMTP id
 j20-20020aa7c414000000b005067d3eade1mr9269439edq.27.1681678469135; Sun, 16
 Apr 2023 13:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru> <20230414152423.19842-2-ddrokosov@sberdevices.ru>
In-Reply-To: <20230414152423.19842-2-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 Apr 2023 22:54:17 +0200
Message-ID: <CAFBinCCEhobbyKHuKDWzTYCQWgNT1-e8=7hMhq1mvT6CuEOjGw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] phy: amlogic: during USB PHY clkin obtaining,
 enable it
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_135432_102005_EC1FAD2D 
X-CRM114-Status: UNSURE (   8.14  )
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

SGkgRG1pdHJ5LAoKT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNToyNOKAr1BNIERtaXRyeSBSb2tv
c292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+IC0gICAgICAgcHJp
di0+Y2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInh0YWwiKTsKPiArICAgICAgIHByaXYtPmNsayA9
IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgInh0YWwiKTsKR2VuZXJhbGx5IHRoaXMgd29ya3Mg
ZmluZSBidXQgSSB3b3VsZG4ndCByZWNvbW1lbmQgdGhpcyBhcHByb2FjaCBpZjoKLSB0aGVyZSdz
IHNvbWUgcmVxdWlyZWQgd2FpdCB0aW1lIGFmdGVyIHRoZSBjbG9jayBoYXMgYmVlbiBlbmFibGVk
CihzZWUgcGh5X21lc29uX2cxMmFfdXNiMl9pbml0IC0gdGhlcmUncyBhbHJlYWR5IHNvbWUgcmVx
dWlyZWQgd2FpdAp0aW1lIGFmdGVyIHRyaWdnZXJpbmcgdGhlIHJlc2V0KQotIGNsb2NrIGdhdGlu
ZyAoZm9yIHBvd2VyIHNhdmluZykgaXMgbmVlZGVkIHdoZW4gdGhlIGR3YzMgZHJpdmVyIGlzCnVu
bG9hZGVkIGJ5IHRoZSBQSFkgZHJpdmVyIGlzIG5vdAoKSW4gdGhpcyBjYXNlOiBqdXN0IG1hbnVh
bGx5IG1hbmFnZSB0aGUgY2xvY2sgaW4gcGh5X21lc29uX2cxMmFfdXNiMl97aW5pdCxleGl0fQoK
CkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
