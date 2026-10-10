Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE0CA9EC5
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjYj9+BCWe9oqwFTh6aJ0N1VPtTqbr4V1i5jLJPbl8s=; b=tZp3lldu8aqEIU
	+qjZMyHLGVHXsnWOgeuA3RVoRWQa5zXTZo03rFZYlMz+hoNY8aCjwmjrlHqUYhX2Jtzzn1wKehMFh
	IPKcpU+1JFdyjo1RQC5RA8jSmFBIUbEixXo/JVCpcozk/ib+eSjjqcrocZ32gUU/l8+bM8JrMM4+R
	obyxhYRevqRHHBxMDu5qSuPwim99sAJC6G7LF42JRDMET65BrxQBbLBxI/BPo/Jwi/fdTlG40gWmD
	JnpOiqMZTIIJ3wPSYgo27mtiaDg6a+RSM5q28KI6sbv/MvRzoAoJIZMmmZ27QGbp/4sbCwSTJ5Iz/
	L50znq9rAx+CgbIWqKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfB4-00000008ToN-2A3F;
	Sat, 10 Oct 2026 22:04:26 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfB2-00000008Tnk-0PpQ
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:04:25 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-675617e81f9so677908d50.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669863; cv=none;
        d=google.com; s=arc-20260327;
        b=RLj+w3vQ0bQQKM7edpVxwZ/ZlKo4SWEkE36HXtaLYrlhht8XJvMC1v/A9XzBAjbTqf
         AFt+W0IIybbMM4jzsPzmyRFtfMHkoYyGKp2UqVVglrzxB8/M7c+/U/yB0cBX4CtaGcjj
         PtGgLN/STDDYyhaySiugl5veZ6RG/6qqOWof3Mq/dkaEUXXA4tXRpjTABvqNtE4ZJIWl
         cm9kWil48KS8xhW/IxsWGny0mK/MXUYkT2AQkSl8X6+d1S30dMaM4E51/s41o2Za6NIi
         5f5hxBxYplgpgOnbZcOtInTXdY9xUVadY/KxWsnrKNyukwG9xU4TMlmr3fB8MAN3kPE7
         YIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        fh=xocbFvp4I3FcXNwMqaDItAkCGPFjYT5x2Ro4IMP1FMc=;
        b=n1rx41b0b+/DZesLsOpjYqYvTfdWeHVI8ScTm+FW8HKsYW7/2Q7UbIBQIBhLs9e06P
         DPA20NDi7r5Yld0g9v3IpeIBpGso1vt/paWOPQPN06GleXWeXTmm6EEGF7gFNox7awhE
         k1t01jlfbzD8FMeBnYi+40FclZFCbV/F2ow1BmpK4bAbrqE3zRE9syt0kP3/fTb8Oez6
         gyUn3t9JgqcdsVkNJb3mjqY/pn3fcKMz/eDGcwlUilVWiPJoaFDlLQNQJT2ph6u+QqEu
         y79pYL0M/cOADRftSFDq7THwT386WE8GI9TrC8oFUNjW39S8IDRzBqAXvRl56SvvUKLm
         3irA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669863; x=1792274663; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=m1Bjmqsi7BCNV472jJ0MuMSL5oyjriBUeLMnkr1yWfFBFBnrsFBzdGdT7lwa945ZE9
         PUzVNrOHko8QXeT4DV7ihscNZEPUlsQhGsXTXhiFQiEHelSdw+odj5n4QoX+soznmXTJ
         RMvasSC93lNJUcuZSwwt+j/SrF26FuGVTBOan1IXmIIsJmXYEfjar2AwEYAQrmjwAMTH
         axHOV7/xjU6x66PAKZoJZy3Bp6zsWrpIWjCVs7e6ie5pT/x+GN/iWw/lcZ2vSPI+K2KM
         9z93E777D3JRpA3DRIn2+AIHAjWr06pXv+cu6+jz6HAyfVulWtUeIRdsRhbBkkrIQ/VZ
         PiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669863; x=1792274663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=Hdd2w+m77cZy6CYCviT6UfsfXIQ4mJMVjgqUVNyDXE3jS/tpyPInkaAGC7Wr/z2sNq
         eV/N0jEGqjuOIKywNfGMej7CZW+OocWN0Mx2stOaycrapOMTjh7hkALWzINYoaH/k/B3
         XmkSJ92QcjmGdHpyhx8KA1IRAl5gpuPkerTIBWtD8XVWq2GGn9cZEYows8Yh0f0S8pI+
         okPM0Sto2ZZItZOf+xrUAbdsT08ipPZL5evLi+iFp1afDWLo+B8F/CNDxV2wr3LT1bFv
         N+OcioFlJNQ+6sm2cy+C4hV2q3Z5yJrXEejR9qHtP6lZmCzRA2Eb1TmxOaAIKsxoi7Q9
         gQhw==
X-Forwarded-Encrypted: i=1; AKwUvBwn659vmtWWwLLexZFGC+j+hit66XEU8wimAhmgaSQy81CR4ZpOsnzaAylELZDJzr/46WBvuz7ALYx80R73@lists.infradead.org
X-Gm-Message-State: AFq9FYJkh6VXUM9Tqi6/xREFAgm4uiypyW0eDKKQvbUmxgT9HVyzMI3w
	hRAP7jcvawfQJlCuotgsjDOgD6Lhu03qmlKh4WK8G41whMWjqA9iugitkS0vM1GEia7xSYV7uo5
	YDsBFqScK5Khv9ySjqBVL68GMoVjJQ9cDT8ZutD8eRA==
X-Gm-Gg: AYBFou1i44AvV5yE+kT/9O9TSyKKhouvc/qc3J5vnNPmgNdt63g++jz++LwikHwkWMs
	2vg7lBS9ykqcbYDZGYEY6ynyxbWJBi5yueyo4XDb1lPLOtktSrLh+Zr/zLxgtHdxUZkl2GzGEk1
	FX+E+mBvFsAeaf6YKoZ5n+49Br70vkuEGObrvHTk6P5BCPn6QeU23vMQOgPZGe8DOpQ6qrBUdj5
	IFdt14NJKnqWnrVu+W8djnhD3duh5lTOngMzEFsoTekZ51A73F1mmuFfRGJ/P9EZ3Av6xwiqUT6
	aneASEiYKUbkz5jgYwIVJjoeWTZi3l/tsFHdI/CyqtLxR4r8thszwnTBPl6BpLQ+AGyLuQPXLkl
	v5QTT/NvOdSgtWA==
X-Received: by 2002:a05:690e:1407:b0:679:24b6:fb2f with SMTP id
 956f58d0204a3-6793678c7e0mr2255529d50.12.1791669862784; Sat, 10 Oct 2026
 15:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
In-Reply-To: <20261010105900.247342-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:04:12 +0200
X-Gm-Features: AclHuK9eVPsrLu_8xG98kzx45q0ow1wl_zWO8WFmOGBNd_k8l5MABlydeHwbbRI
Message-ID: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_150424_166628_EFA8695E 
X-CRM114-Status: UNSURE (   7.89  )
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

SGkgTHVjYXMgYW5kIENvbm9yLAoKT24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTnigK9QTSBM
dWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAg
LSBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLWR3bWFjCj4gKyAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiArICAgICAgICAgICAgICAtIGFt
bG9naWMsbWVzb24tYXhnLWR3bWFjCj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWcx
MmEtZHdtYWMKPiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtMy43MGEKPiArICAgICAg
ICAgIC0gY29uc3Q6IHNucHMsZHdtYWMKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAgIC0g
ZW51bToKPiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb242LWR3bWFjCj4gKyAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCk1lc29uOG0yIGR3bWFjIHJlcG9ydHM6IFVz
ZXIgSUQ6IDB4MTAsIFN5bm9wc3lzIElEOiAweDM3CkluIGNhc2UgaXQgaGVscHMgSSBjYW4gc3Vi
bWl0IGEgcGF0Y2ggdG8gY2hhbmdlIHRoZSBNZXNvbjhtMiAuZHRzaSB0bwp1c2UgImFtbG9naWMs
bWVzb244bTItZHdtYWMiLCAic25wcyxkd21hYy0zLjcwYSIsICJzbnBzLGR3bWFjIiAtIHRoZW4K
d2UgY291bGQgbW92ZSBpdCBoZXJlIHRvby4KVGhhdCBsZWF2ZXMgb25seSBNZXNvbjYgd2l0aCBh
IHNpbmdsZSBmYWxsYmFjayBjb21wYXRpYmxlLiBJIGRvbid0CmhhdmUgYW55IE1lc29uNiBib2Fy
ZHMsIHNvIGl0J2xsIGhhdmUgdG8gc3RheSB0aGF0IHdheS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRp
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
