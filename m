Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BC2C54E5D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6XpQ34C8SN1qczJYLlx3p1NP/PFaeD8gzGUcOpldws=; b=fdkAWzLQIY+tIi
	jNEdkkCfIke1tOhkBJzbYwW27WVqezuXRmHLCN9ttz/xWJx2aC+PIUfki9MbjiPZ64qJA7cZkt5Ck
	WSV9+mYEGCKgn30AwSi2OnL62Q3dUAfQtNwlnhaC0VFLtXjXR9oIVCzBrq5/hU0H76BH3Z1J5rhg9
	JVsCbzqjxkWdbrFm5djFxFxUnZQ7/rLYZBZFaZpRnoiXDv5VB2uAXYh0reoLgVhOccIaW+Ex/BLSv
	J9iV6gr7uUGKZmirLeFP6JbnMLEmRt+2Fj1EJN6Vx3cHEsHDBZzMrAfAIAzNlM0opSU/pYxm5Di6B
	qKfs0nA+HEU5fuztqgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5oW-00000006pYw-1fYb;
	Tue, 12 Mar 2024 17:21:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5oS-00000006pX1-0a3e;
	Tue, 12 Mar 2024 17:21:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dda51bb52eso15275015ad.3;
        Tue, 12 Mar 2024 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1710264070; x=1710868870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbzYizPrcA31r27IhlGfXYPRToUyr5sIrzzrrp+vlHg=;
        b=OK7q5AFLVt6WVJnNTnPQbKeHHT9dx9o0d2fufMziA62z8bSYN9Qv2jcvrkVsvjn6FJ
         RrkOFnGldz4dBfpIjQWqGn1K6PTtUvz5GeX0+KeDJcdMJPMuLrLvAaOLPESLhlfJPvgT
         q0Al3901PCugMx4gILv+PG5JORZSKKoSQFb4qJF9OglI2dpV2GIthXkcdSd3h9y5sRdT
         vu0x+yvS03vxK1M5vQM4x/JeHIvT8Qzoiuyw1K5Eowi+A44MkZz8esGPNruBPXGtDPUx
         wYYSM+GhXPl3YjjBesA5xei3Cc/aW1NZ7YB50zLoexqz58ILBAW+Q8VJRVdEHgLMVD2y
         MHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710264070; x=1710868870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbzYizPrcA31r27IhlGfXYPRToUyr5sIrzzrrp+vlHg=;
        b=rpSZITEDWTwwLRBY1Sea8hVb2P4M4+CcmFShiieEuKP6zNrm8+mE0rM8l+MiGhtPm6
         cM81Ud2ApNa2rTwf+JCRne4TgFACXuKvSOVBuw/cH2z1L9T0dRpX2qcLsGI1M42bT6t6
         lEAE1s/j9QoEOVqwbbFripCJmpILy9QBAfrltm+f6Z7OlSpvH5siQwevKl/5S9zx/3cd
         p7IIux+YQGAOdGWdoeJIhk0BrCPCU/dEn8p3wRB4N0u/2czU6MfsAexX04Cw2OAKXmNT
         prhejekerLlMAhaP6IQEyXw6MgABzm8x4RyaaHjSxFFlXoTQKHPiMxLKBd/Yxsbk4n+6
         uCrA==
X-Forwarded-Encrypted: i=1; AJvYcCXT8ixp+dg766aGc14eSSc5mpwBfKe5fgUSriwBnf9FEiPr8al1+owuq8ssdMEHEWlwzGqyX8mwWxotolEVG6F87iV82y8T5i57qogu4P73QCSLHxbGZl9L/iJF4kgLDP7Q+8p4sR7Rq446jXUjUUrj1eKBQ6jBjA==
X-Gm-Message-State: AOJu0Yw8bjAevOmrwzmqHNQuTBBV4c+Fae0ZgC9NJPCuYPl6NuRn0jVf
	C38p2EiARcOGsQl/j/El29UPLFGaLYMv+Y0WnLsQVwNDcBtzgkMK+MAkllZ7TaEg3v0fLCPIpJ4
	7V3oa/5viRnC5hccAW9uPR5sATWiYggi2
X-Google-Smtp-Source: AGHT+IGbu3in/CKHQtuChqNrVACfSVFLlMyrSjQJ9lpv588lBvl8onmp+AGlxEmJDhJDIS0HIA9ruCBxORmovg9TRyw=
X-Received: by 2002:a17:902:7ed0:b0:1dc:de65:623b with SMTP id
 p16-20020a1709027ed000b001dcde65623bmr1927169plb.60.1710264069927; Tue, 12
 Mar 2024 10:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com> <20240312-basic_dt-v1-1-7f11df3a0896@amlogic.com>
In-Reply-To: <20240312-basic_dt-v1-1-7f11df3a0896@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 12 Mar 2024 18:20:58 +0100
Message-ID: <CAFBinCBiCoOY7wK+8j4kNZwny5LFTX99PLk03gUvqnGxJXgvEg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: amlogic: add A4 support
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_102116_213103_01937709 
X-CRM114-Status: UNSURE (   6.82  )
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
Wy4uLl0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogQm9hcmRzIHdpdGggdGhlIEFtbG9naWMgQTQg
QTExM0wyIFNvQwo+ICsgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+ICsgICAg
ICAgICAgICAgIC0gYW1sb2dpYyxiYTQwMAo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxiYTQw
MQo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxiYTQwOQpXaXRoaW4gdGhpcyBzZXJpZXMgeW91
IGFyZSBvbmx5IHNlbmRpbmcgYSAuZHRzIHdpdGggImFtbG9naWMsYmE0MDAiCldoYXQgYWJvdXQg
dGhlIG90aGVyIHR3byBjb21wYXRpYmxlIHN0cmluZ3M/CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
