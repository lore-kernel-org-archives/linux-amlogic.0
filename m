Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C6C77B73
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNrOm8Dgv/MkuEUjlKL+qhRvffXrfNr0BHpiPVc810M=; b=d1zvMjhY9U0yaR
	ru0PA88DSP7qO0LWSZvq70aKuQHkrApv4nc6NxvMpnDv1C85ffS5wOMRENxJwcNtseNS2rL8XN3A5
	SadyXEvFx+0+Xz1ULLcnssl/OzA5XPcBM4iaqRFVMPz7zldLhs+8nDRkcEextTtyJbHlGFpKfQVAA
	okqOGlv8wL8KusjXaU1/NAKS0E/O2/gMkWaG70dUjENU5pVndoctS5iuCAKA6OQ/mGat0M4qNOJMI
	yk58UGqG4t/KJbUXQxhQ18kLQmwj5lHcFlTcX+VsdBzpIJL0W2qSkXq0tGDeit3mfW+M9HZzdsb/n
	afw5hawFGck6wXWHAoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po9Qc-00EQeB-1O;
	Sun, 16 Apr 2023 20:56:54 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po9QY-00EQcg-28;
	Sun, 16 Apr 2023 20:56:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id xi5so59160463ejb.13;
        Sun, 16 Apr 2023 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681678608; x=1684270608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WS1S2J47m9oZfeWP6yf02N4PR4c/sbbG9OpnnKVNb0=;
        b=Y1MtgDTM9NDmIpajiqJlE+6DdkvMLOoVa3VmvdAft4qxVRnLve++ZydABxkHv8okQs
         lNdimhxM1p+SzvXifOHGHG0RxMapoI1z00KvMeXjDXsFhN+mJmMSRPIwcTNq+188RkNL
         w8y42mUxpWfiaOKBd6/x+4Vvm6ONnANnO80FXhOpioMXcOvkqMj2gPhEg6VPOxJxpleF
         h9/JIntF3/Ml8569J/WDwrEtlxvV7WAypD48jWo+HNbZXSjTAw/9Ue2uG/zSnQvbrP7i
         jy1EX3IzlOb4ECnd5O0c6MdrUbRX2ZO13DQMTQl2y6yqL23SqjPnN/piGBwGtr3Ft67e
         8sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681678608; x=1684270608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WS1S2J47m9oZfeWP6yf02N4PR4c/sbbG9OpnnKVNb0=;
        b=JNeKMqM+BlRLwyY4rZaJD2tWKjND3df7Ho4FFEtKAJrj34qtYADkF14zGZVS4CX53M
         i2TGfpBLRU5MiH8VPkxVIX2WOPzEnjir2AnRz3BYL9/dgKq6Cp/Q7dIesQIEd6kMzn3o
         cOjWaaU/pikE0FIGE17p7ZyIHgFZbiTk/bRQuN60DZ9wG5a1gqYYg9BrpqsQtLOO5qF0
         ERNSMOYCw7hUeNmldErLnOIjdYKXl0wU8qRhzOyYzUEPVFEtqgyD0mIWlP/p4ugIolY5
         uy7Sjy9DelVCNsE47GGvA0vr6w5EslJIw6VuinKnjj+Ick3irMLefPHkc9G17oLOUIQN
         l1ww==
X-Gm-Message-State: AAQBX9d46RouB1Sef/4nCYlQIdAKVdgYKDnTYm73bVKtNIjuBtLdiCds
	euCmCVjfOMYhrWMGw0TVcAHrQKdPsN2GiRDzZ8g=
X-Google-Smtp-Source: AKy350aAl7oqe1ri0rb5+ehDUovVW9O7EQwAqt1kFQNqQPClScpqKDS+kcHcWi9AGVPNc7cnTNruAr0Rv5/TYwEPLuE=
X-Received: by 2002:a17:907:590:b0:94f:3338:2431 with SMTP id
 vw16-20020a170907059000b0094f33382431mr3499453ejb.32.1681678608156; Sun, 16
 Apr 2023 13:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru> <20230414152423.19842-5-ddrokosov@sberdevices.ru>
In-Reply-To: <20230414152423.19842-5-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 Apr 2023 22:56:36 +0200
Message-ID: <CAFBinCDyUBWd-V0mDy_edzH=3JM5SAuX=vtT4MG9Fb62Rcv=mA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] usb: dwc3-meson-g12a: support OTG switch
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
X-CRM114-CacheID: sfid-20230416_135650_702437_3C38C79F 
X-CRM114-Status: UNSURE (   8.92  )
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

T24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNToyNOKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGR3
YzNfbWVzb25fZzEyYV9kcnZkYXRhIGExX2RydmRhdGEgPSB7Cj4gLSAgICAgICAub3RnX3N3aXRj
aF9zdXBwb3J0ZWQgPSBmYWxzZSwKPiArICAgICAgIC5vdGdfc3dpdGNoX3N1cHBvcnRlZCA9IHRy
dWUsCml0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBhbHNvIGZvbGxvdyB1cCB3aXRoIGEg
cGF0Y2ggdGhhdApyZW1vdmVzIG90Z19zd2l0Y2hfc3VwcG9ydGVkLgpBMSB3YXMgdGhlIG9ubHkg
dmFyaWFudCB0aGF0IG5lZWRlZCBpdCBhbmQgYWZ0ZXIgdGhpcyBwYXRjaCBpdCdzIGp1c3QgZGVh
ZCBjb2RlLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
