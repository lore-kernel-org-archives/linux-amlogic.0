Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9F6CCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3aHw87wwY6OigyH65OCjActG4FX6rOVK5f6Mx9la+U=; b=G6veiEmi+h5MJK
	+KCVZb//+2bz1QP/yjm8rL6gdKIRnoVKiUprftdh7tshIOgcCoqN+DD4Z1QuBe7wq0OT24v7YP8Qt
	yfmtztkIc0uWmcDTYGCLJDThVtj4NAUeYlOnEr2MpPbaFLOhLxbvmbrZKUWiiQKrI9FSdef9o0jA/
	UFYgzee3dvqCqhi08F0uuU4sKWgUcuiCPjimCdLeSuXpmkoayV5uprCDEASSo7jO9CZAHhpS2BNe5
	JReq4Po+usFWonTs8zQGNMN6xf2v6K6/m/3wSLO90P6XBD+tXor7ohDVVV9PXH/i3oMQbLBHzDrRV
	KZuI+kcE7U8W2B0+/lIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVRC-0000000686u-2xFj;
	Wed, 25 Sep 2024 17:04:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVR7-00000006865-3zyD;
	Wed, 25 Sep 2024 17:04:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-206aee4073cso161725ad.1;
        Wed, 25 Sep 2024 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727283860; x=1727888660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq5wCmhzzuQ7d/iEftzkFjM8U+0zxxmrIHVD5NJD+uU=;
        b=DOPLlLVrL0n64vWp0uXXmrcpSN+i3IWKCq9SFGe6TJsdsmEObFuWpTqlddLs++OI+A
         15TsuaZ3+kSt1F6fil5s25SbWyqLfW0zZUnzUCgNia8zvkaOcBdmmqMGRhpcRUMc+I7Q
         pFMerzR/q7izBA4s6s9Mp9N6PqxHZGFj0UKfdxmGZfa1BieY/LuByQpoahiF9taxMUS0
         qgNeir/R3BstgLHp/CciynDF2b0XPB1UWhgk07+d8OALyXhFzBCTy35+XjT1MwbY+rLC
         Sg3M88q0c6GJtOCVEXgs/+Puu1e5zEF/pUT+eQahfexgEgqJO02oJB8IhGCNbkilCTWW
         9BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283860; x=1727888660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq5wCmhzzuQ7d/iEftzkFjM8U+0zxxmrIHVD5NJD+uU=;
        b=cbke38wdKulck4mNGFA7nYw8nxzqSTJSXB/NPKeUYxPkpWKc05peI4AWok17ljPQZb
         EuXYUSCJjavGZrEYiqOavDzPyecMpFsmXTzUC0cCadH6l73tpkqmkWTppBbtAnd1a24q
         imMn6F0MqKHAVInQSUz11PrwNjwKH0S6P3C7hyMZEMppA4BXGN+L1zcrenovPcgrndk2
         hDgXsW53/DuCh6gFUhxtO0pkmFbNzsgXXmgVkMCVf9ICTkpOcDKKmnn/NsaG+6xGsb85
         m+nhiO3VYbQAJO8U7YHEGePxEqgf7NsrByqneZ9GhZOhln6qj2RwGvfvIcZjWBNz8xix
         X1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAyMcxBEm9upuxTLilkkwSokIwndvQuERijz9B2glC27mAeGvlefENnrOq6c1eABjMFI3QnhkfSZjMpkAnSalLZw==@lists.infradead.org, AJvYcCXp9uzCM2KpjH+GtAntbkV7iWsZ3Sh3Dl06TOmljBvhFB4+weskGxKLplMIF7Uhc6U3tzIeFwsFHm+zXLin@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96mFxu/awe0ZKO279/pCcercc9HlFXljfffxOyvTVDBzYXX8n
	TZz7G42W8EW0x6Lm0M2hkE1fkqgCEQi4UGsSuRZdbuY1YkOYUsnFanVCUd22ShuZvtsHuoYWCNo
	zLzRiYyJmyE/89K7cAUOPq3bduus=
X-Google-Smtp-Source: AGHT+IE2KICxen3r5RdUuJO0lNZf+001DnRTeqMDIWxZGbegnH0vvIeIp8h58FVyHhO5R+jUC0ikKFeuNZleClYHXmM=
X-Received: by 2002:a17:902:f54e:b0:206:aac4:b844 with SMTP id
 d9443c01a7336-20afc400e57mr56364895ad.6.1727283859982; Wed, 25 Sep 2024
 10:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
In-Reply-To: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:04:08 +0200
Message-ID: <CAFBinCCMzxf-pskQBZRs10CRczYt0t09xS9Urpp6Cc3cyu+8jg@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: meson8b: remove spinlock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_100422_012469_E38195BB 
X-CRM114-Status: UNSURE (   9.33  )
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

T24gV2VkLCBTZXAgMjUsIDIwMjQgYXQgNTo0OeKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoZSBzcGlubG9jayBpbiBtZXNvbjhiIGNsb2NrIGNv
bnRyb2xsZXIgaXMgbm93IG9ubHkgcHJvdGVjdGluZyBhIGNhbGwgdG8KPiByZWdtYXBfdXBkYXRl
X2JpdHMoKS4KPgo+IFRoZSByZWdtYXAgQVBJIGFscmVhZHkgaGFzIGl0cyBvd24gbG9ja2luZyBz
eXN0ZW0gc28gdGhpcyBzcGlubG9jawo+IGlzIHJlZHVuZGFudC4gUmVtb3ZlIGl0LgpUaGFuayB5
b3UgSmVyb21lIQoKPiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxp
YnJlLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
