Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B4C54E5D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MlveJn0YG6cTeyRSZQE4tgKlF50XJdmPoj1R3STW30=; b=mDN5o0PKEEwrpe
	WZFfkqr0wid5PxokfzRAMbT4aN35mSAexh6vbSWjfXrOfyDTCUfxxnMFK6oqp51Y46kIrMmLkt3v+
	JLVinSG+/N0kB18Kh+mg9GIMbeSdfulRXVxSZ9eClvXDTpZnnzs7J8F+rFG12WwpYc68X6F7gOb1+
	rMt36ecB7LYV/veOmeR3yxm/V8tZUhNktf6E+PRM5CT9S0iAJw13aM9YKrCFwhCkWaPo0OJDiZyRM
	nNp8wVQl6HP6Ij/3lOwaPoqFNyJgdwD12VNWCnMNvm7zXRpq/yW971sErSaonWLwFCX66HV/7neWo
	oU68kGVZaUn2gf/V2G5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5pN-00000006pp7-2ZUK;
	Tue, 12 Mar 2024 17:22:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5pI-00000006pmX-2x87;
	Tue, 12 Mar 2024 17:22:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dd8d586126so1408835ad.0;
        Tue, 12 Mar 2024 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1710264128; x=1710868928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pW6mgK4CR5cBf8JQ9xAERN+Lfkqo7JYFnynnT8jRXe0=;
        b=C1nICqekc3yshJhf5/wKTYwhUvKwt0pqrXRmKnSOO+HOmrnHWdBB0Z4WuY1MszyAJb
         mMN9HMwQW7S0usVsz6PTNNRBjdzDLdaksHwktKGrjRmdtayTetOnaoPjaEK4ehKmHva4
         6B2OKVv/JveYsP88pETuLXCrdM54AFxgTbVP/8UqvDNLLWzcgME2I4XgPMa0uEqy/lHk
         bixsY/WgcRv20XIqm4tRYklKsrN4pvuwm0kHO9ytGAvbiW8JpCuReBZWtLEk30rAkvAR
         bvA3yrHp/yCOtOYudsMph+0DARr3Fo3jMmDO7ObqvArlhrvGFf5IVcugW/ACJPk7O9PH
         5pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710264128; x=1710868928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW6mgK4CR5cBf8JQ9xAERN+Lfkqo7JYFnynnT8jRXe0=;
        b=Mqhy8BeyCbInoZReG9/hKtNxqArJboiB9mMmXYnzvxQ4bSr1o0ZzYfgdo8U5+fG/vZ
         DRnLqfeSaGtwj5MXItQkLIO+0wMrUngz7WVj/VkoIieE7eT6VhT3rAYWVAOiS3AU+qam
         8208XORnRptrQqijyEf9wnjG1tDZKg4oeNr8jPxiXg7jlZPMfHYRJxqtbycYIo4rv5Ba
         YcC3saSmWPchnFKmQPu6+aqpnsw3TQJicGmAbVpCaBBAn7DtbtPQE6dNHx8C3AKVaytn
         AOqA8Za8tK3I3TxzjEANbDNUaTsSgto9lg81wjCj+WcSy4/L/Ww6ioMw8OqXu1VfhLlV
         W1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtPlEOoUGmIN/NM1Y3MpV6EYt8vIvxgLira7A98Zuwrs3yLhacr1jSX8uvNuz4bYmCUFJ9VaNiG/gogVwnbHVdGGdpeWCnkBKlVISphQjb800Ac1DHoZ/xuGA2LkYLqyldRrHEUWGUnP9KWPXbO/Gjm7dyHzUumA==
X-Gm-Message-State: AOJu0YwH+x+Ht7HM8+4X2xd6prxGsygszRB31o6THUaKlmv0iEnssIjY
	0RhT7q2/jhig1gvpdPYNfdj+8hlhIJUvfaSi3znNFN9AC2UP7HHf/49EPFoddzHyFfYCFN/rC0t
	jLIfYUKCNqvi9PBtrUxf0gx6Wk98=
X-Google-Smtp-Source: AGHT+IGohFeA7qz3PV8ixHbJEb+jrVPAw1ItAoo+rIPl3SMXMz/LBVXnwGqZU6IP0ru8Xel2fopHaI5YBqR39t0IDAM=
X-Received: by 2002:a17:902:7245:b0:1dc:cb46:6810 with SMTP id
 c5-20020a170902724500b001dccb466810mr3406182pll.41.1710264127680; Tue, 12 Mar
 2024 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com> <20240312-basic_dt-v1-2-7f11df3a0896@amlogic.com>
In-Reply-To: <20240312-basic_dt-v1-2-7f11df3a0896@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 12 Mar 2024 18:21:56 +0100
Message-ID: <CAFBinCCzmmVf+iyFkjNRmyyrjcuSS-s7qCYZMwwK0z-FnYMeqQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: amlogic: add A5 support
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_102209_437894_7C8EAC3C 
X-CRM114-Status: UNSURE (   7.43  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6MTnigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Wy4uLl0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRzIHdpdGggdGhlIEFtbG9naWMgQTUg
QTExM1gyIFNvQwo+ICsgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+ICsgICAg
ICAgICAgICAgIC0gYW1sb2dpYyxhdjQwMAo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxhdjQw
OQpTaW1pbGFyIHF1ZXN0aW9uIGFzIGZvciB0aGUgQTQgU29DOiB0aGlzIHNlcmllcyBkb2VzIG5v
dCBoYXZlIGEgLmR0cwpmb3IgImFtbG9naWMsYXY0MDkiIC0gd2hhdCdzIHRoZSBwbGFuIHdpdGgg
dGhhdCBib2FyZD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
