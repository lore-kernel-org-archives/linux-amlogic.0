Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06430C3ABAA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upG3jVwHE/eotWZMZ622ohEyE7L3LUYmEG5lz1hgumA=; b=rwKKmEBAbLU3gY
	/gQ217Q6nDTJsejQIgI020yckLFB74InPH4Px0WcArzgZrVT82jiPe2sZvQS2OHld9uZLqKsZgwrW
	GM68ASxcivRqcxaxIGgNsr6jSJxVYDfI4Zn3+DKOynwxs2bKRHp7RWrOyo1Js70qMn/XlqB5trajh
	WkVtGnkEsSRZJKyoXCFb8WjFR/iAX8HGKm0IBkX7l6Kw2bmSuLO/3iLo+/CExTH/uoED5Uy3ER5l3
	qVvLYWxbS6VqbReow9DRp41Zz+mun+fMlQP7Dwq0dgidPnEcCSsdCDR9sqVGTsuuP6a+EIJ0x48ko
	d4YCTHqEuAhQT/E1urQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkp-00000007SAa-1sFz;
	Mon, 05 May 2025 13:21:07 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvct-00000007R9J-2Er6
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 13:12:56 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so10021151a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chewies-net.20230601.gappssmtp.com; s=20230601; t=1746450774; x=1747055574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PLmUJUdgMb4I0FCDdfNItxNNG3T0tV4J7kVIBv0o0U=;
        b=kolB+jKxkZilMvNTDikXsMVaxPhFHhjs3bk1zv/X/orXhuwtNzLb7lFE5q11tk1D/j
         D3y88vk/zBkdgSR+4Hdus1Jeew0zZUPf/no3eWVYM8Kx6ep00+EgQdi0sGc4qKvkOsvi
         uQlNsJCvoMR+TFwsvbHCXX0gH/Qj2RDglYTKiJk6YuWmFdhDbpvisZafmV9QmIo74rfF
         JGik5N1WKNtZriKs/Bq2G8hVPvemRgc6gz3tF3YtjYJe3HaUAnE3EVebD3WKsKwbp4Jt
         BLaLqUX64/wK4PYhTGjBpRT31iu+KhOenG92e46PQkSURmfcntLCibplIDrpl/xzgac+
         aG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450774; x=1747055574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PLmUJUdgMb4I0FCDdfNItxNNG3T0tV4J7kVIBv0o0U=;
        b=SKPY/NoMRWkytVjUCmjiDa3/5rNM27nFwA4nU1M4n5yxMKY+I7vxq9cXYf/RHwIAin
         OCH9eOllIbBxDSfRHoBZMIiTE/1HWLAy+gkYsC3gDsFTNd8BnMyKaaMVSD+E9VuJdBsc
         JmHpod8HDYIwNRlayYpZ0uT0YNiAAaQ+BsnhHMbAECbtZ1ooJNWPBZeu3B4ACbFAm1U3
         /XbKrVTpyCVy8DXEpi6vPkCwaPw2OC1K4kkYVCz4HR8y5Hi7YSx+g702RWh/A8+SptTJ
         ynjjJgQMxL3fqqY41q9triMI0wcKOTZqgMhMtNNm42l+QhXjgwrnQgy93ikHFoHo2sgB
         +H7A==
X-Forwarded-Encrypted: i=1; AJvYcCWjrFZQquVI3QIOY+2W/18nOPz9YvOj3E9W28N5Hv2zUhpJfruQ8xQQ5UsFkELZjHpn2EiRz3TlLQDdVsrZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxnuorBsS/ts4jYdpBszYkla0n/66VEDHUqoC0wo4eR/aDJNwOn
	GTZrU+V3/IVx8ObAHfUiVb2W6moCaVzr8HtXKchyqB490xbR2J9O+eN9tfejIS/XC1YKfmkage8
	vUJ+vQxyaUjFy8PHQ7qmZEeRDERqLZXYkWbFmzKDxKbjcJ8gFhA==
X-Gm-Gg: ASbGncvcjCy/djdOsCtUqJcCHWjxd207MU4Py1iJomOmArY2+dMQmfPk8bNEjc3sZ2m
	vr6+ZUfQvGE09QeTST92isZlbQB+gf1Hq2v47m2GpriE6t+3B84hi+MaDAfXAnaT2J5W+m7MdZf
	eoI+xJ78YJuGRR+UveoHY=
X-Google-Smtp-Source: AGHT+IFYElk0llN1ge4pi4ZSXHpMCLLnNKx89JuhozP4HSomsgFEAmnq/9ASvVYW1zWldmmYnM0dnyeW/hjmdTFJlwE=
X-Received: by 2002:a17:907:c1f:b0:ac1:791c:153a with SMTP id
 a640c23a62f3a-ad17af8392cmr1114328266b.27.1746450773558; Mon, 05 May 2025
 06:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org>
In-Reply-To: <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org>
From: Wayne Schroeder <raz@chewies.net>
Date: Mon, 5 May 2025 08:12:39 -0500
X-Gm-Features: ATxdqUF4lges0CS6ogY4qszXoi_2lLRibq4vcliRXnEvivpaFf0MHzWf0mKZKmM
Message-ID: <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: neil.armstrong@linaro.org
Cc: u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_061255_767044_939D1E3E 
X-CRM114-Status: UNSURE (   7.10  )
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

SWYgSSBhZGQgdGhlIHVzYiByZXNldCBjb21tYW5kLCBpdCB3b3JrcyByZWxpYWJseSBhdCByZWJv
b3QsIGJ1dCBpdApkb2VzIG5vdCB3b3JrIG9uIGEgZnJlc2ggcG93ZXItdXAgd2l0aCB0aGF0IGNo
YW5nZS4KCgpPbiBNb24sIE1heSA1LCAyMDI1IGF0IDI6MDfigK9BTSA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz4gd3JvdGU6Cgo+IEkgdGhpbmsgaXQncyBhIHZlcnkgbG9uZyB0ZXJtIGlzc3Vl
LCBVU0IgbGFja3MgYSBwcm9wZXIgcmVzZXQgYXQgcHJvYmUgb24KPiB3YXJtIHJlc2V0LCBkb2Vz
IFVTQiBzdGlsbCB3b3JrIGZyb20gVS1Cb290IGFmdGVyIHRoZSByZWJvb3QgPwo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
