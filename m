Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E6606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n53wiZlq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jvBkHUmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f/moz9hL67VDIQtGzG+laaaSy4lcvm/5jtPJR/mx+eI=; b=n53wiZlqOtKXc/Fdo2AwIZjZOe
	+WBohe+dGP04gdkk9jpUaEVxpBCIdrVRl/ihfXoN9qnr12W6VBL4G3puEwlybBxdEJCI6QIyUC1cF
	oOLZSViZmvNmq74E49t1xlWqnhay1qeHAHEWV67PpkfEWY8s2Bf++P87NcBwWnjj495IIVaKdV6fv
	vwbLmIeqy1ViQ1K/ooGMTLGsPVZUSroJFOjoOo5JizqdBbG3biT0GcojqU9OR6jg9jd3/u8Eazmln
	UNxJsmvHtcknbX9PrDmL2AUb/aLYResYkD6s3g+tPtFrG3n/HR8hiB0hP3mqP/8in8aegtF/sLaMB
	A9CLr7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYc-00000000Ig7-1iFF;
	Sun, 15 Nov 2026 18:02:26 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYW-00000000Ic8-0sNC
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 18:02:25 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67da7d18f2fso873645d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 10:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765739; cv=none;
        d=google.com; s=arc-20260327;
        b=mljT5fQhK7TVMfG3p3fxih12zLzJ8gHYr7RX3FkfSc/tsntq8Ld0Vcutr3V4nZ0Whv
         bT3kvdsZee8VcdvBbyYs2Mp+eDMR44CWsRSAp54/GXBDr7S0ezEL+fpHALGrE5fR/SQP
         34hmTivJTEWu6MC7yJtifsy8PQkodCA0/JUuoQE0woFtTiY4oCP5qXAT81FCWff3lVdq
         NWF3xLE/lR776W+o36aqqtfVuonO/bhEsEGBD6f79Pj8jXr4spxe9ecWsJ89PvgtQekP
         TUklTmjbeq22SNJiDO52UFxIs2kEn5zqaIotVrKfuoaQNNaY6JNCme7b1dgsb7bYKYfc
         zAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        fh=gOILOeU07LeBKgyELMzUSOALnGFP1vSuo/+fzC2EC04=;
        b=qvLnsa87tIu7hMv67PlZUXE7MWWtrLvd/aTwqPztrbAalLoaeUoVeOpTB8eeqcDD+u
         1OIWOmItJquXRfwDXGJYfHxnomC1Hc/hAkqST9srf0Ix8KIbzyIy2am9Ly5nRa04kLC9
         fpXQ19N4Fuk6dZhBY4pli3LLp1P00ALMdgVYiGHkZn6RGUR+n0398NzCb7cJ5sJfNeEo
         uRZCybuDD22moQR0X0mHnf8zQAbIfNAeE6QpODesKnpJG0XgyEomuiQt4rNd2UfZF6GX
         bAyOKyvQ3g28r+uolITwwT0yKL+HrhnSu/yvaezAJ5YD/IuYfhoc4EBBQF6xg9E41tb+
         nm/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765739; x=1795370539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=jvBkHUmRgDyruGcVIBqaCyLockn+Vemw3MO9UQy/hHG7qhfi9IobNMaLzG2l8o5bGr
         OYtUp5J+zFa4FGAT9Sd2CvsplhKI+lV7LpfYhgnvOvCWiuXIb6LUyO/SOI/nsCt08KWf
         ta9vT0N0/VpxqdL6fLh85gipah1RsGB1euwlrBtwY9jKRf/yRXWxKim4W68MsbXPZUHw
         NV5d3yzXwcN38i7ryrhWMhGSrutuMmTLSvGK7IvLNwMEnL7XsDKj8H2A18jalWSoMwgr
         mA7ts9Yblg5Dmat6zZBnzhX2bBl77W9yA9vVy1GjYrR15cqz9E0ivb+uiYnD8iopLmJw
         umCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765739; x=1795370539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=Q4iRW+wqdgz0zyJMe+4Ap5QrS86jOROky7NpEIqMkzDa27+py45vyKs+deVPfTacmY
         A2TJYl240iJYijYxi1PqMQ8tkDEG9/lPTdOT2YqkdyttmdVZ74Uk8uNi/UTMJF+mcmDC
         qvThGIIIVVO3tVMM70kACtB9Saa/WedmSnI4/AjjcSdBN2NB2pxA34nubtdu+CWv3vgH
         OCc2DEAHjW8mkUt+1MUBcuh6i3DkwPJE21Ep2ZzGEyn1/MXRchPdslST9Wo47beSNTMd
         yxJQA8Da3zqsp3cggb+hcLXgYmhVHvNq6H9Eg8tbkTthLIXhOHiPKJEdBjxxFN/gxYzV
         ikHg==
X-Forwarded-Encrypted: i=1; AL+hErE45Al7aCdrDgGAlSjZbHJn+/9nDb2Ea4KkwQwHJ14xSoBQmIVDHWW2yrjp2QyYdiQPNEeHKCqCycOq3RUv@lists.infradead.org
X-Gm-Message-State: APuU4Z9ID8HEUjCbZQ6BfdewE70dUzDzMIswLB/om7f6WplVQ7vtz9QB
	wybswic/Qvi6A1UPmjO/eUWttVt1rXY4yh2quZqf5+dOMSZwJgbPlTmqYmA14o5JE4uZjQh7jB+
	OX1Wv4rS5fv45Nke4CtVa9rANOQRmUw4=
X-Gm-Gg: AYBFou0mwufXeUIXtvgSYxcKRxUGHxvqYd1ZG2NJONkLRQS5+aBMiywtRP2wavl67yT
	6KIc5dCPoh7D6QDXqkQ0pvL9ZBLA9LlNI4M1M6j9prFWqUs9S0fGSdyEWeWQmfLF9JsY2j53842
	qs0ZgxAuJsC1qXTm4eqRbObU5EFWA88LT+W4pLtRhBAQ+PJKa2syL/YpNr10Un5l8LCS9ENun/F
	KpazbxJd/xPGfu6ga4z31OMOmmIA7AwT0e6SfsJJrGi2Q7XJAHZ+AZ84numwpfulhMo3bfhxnh2
	lhiOJTDlVOa4GL/6vSawNhzA3xNWPUKikpF3QdR/YsPDEfr9gMkHiSJdDzBgJ5QmdNoQkGIOlaq
	bcR+rCrkP+q9uZ+EM+JyvkFguvKcpndKBO4G7UoJRYDEqe1sMu6BWq21miyNLkgXEeiJF7g==
X-Received: by 2002:a05:690e:c8b:b0:67d:9fef:d62e with SMTP id
 956f58d0204a3-67d9fefe0ebmr2566936d50.6.1794765738737; Sun, 15 Nov 2026
 10:02:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
In-Reply-To: <20261113121852.334604-7-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:02:07 +0100
X-Gm-Features: AclHuK982JSfMQyLz3Nt-omny5MSefKP7dqRCWJKkI82T-Lx69OJ3UT6uTKWWOc
Message-ID: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100220_258652_77AC43B7 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMToxOOKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6ClsuLi5dCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXRoX3BoeTog
bWRpby1tdWx0aXBsZXhlckAyODAwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImFtbG9naWMsZzEyYS1tZGlvLW11eCI7CkkgdGhpbmsgdGhpcyBoYXMg
dG8gZ2V0IGEgVDcgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgKGR0LWJpbmRpbmdzCm9ubHks
IG5vIGRyaXZlciBjaGFuZ2UgbmVlZGVkKToKICBjb21wYXRpYmxlID0gImFtbG9naWMsdDctbWRp
by1tdXgiLCAiYW1sb2dpYyxnMTJhLW1kaW8tbXV4IjsKCklmIHdlIGZpbmQgZGlmZmVyZW5jZXMg
aW4gVDcncyBtZGlvLW11eCBjb21wYXJlZCB0byBHMTJBIHRoZW4gd2UnbGwgYmUKYWJsZSB0byBt
YW5hZ2UgdGhlbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
