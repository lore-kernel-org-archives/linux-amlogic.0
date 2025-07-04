Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F69C83F03
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/j+WJ/z50SaLSIjKdKFSC5LUSQU9YtBj82keF8M8go=; b=FSjxX3aaAqXtEl
	Spq3p8k35qdwzAum2yR1gmusNSAUyCHpIwg5Mkq3Aqtm+6MtvN009pwdHnEbXfmYJBPLDP6/hIV8G
	bdj2GY8GDE2dnRWSpkBR+P4b0nWhk6ZjdvvdcaHt0W0cPwxsQyJRH5M07QfLhIj3DFMFRG4DgNtKO
	behZWDPDev76DUKsP9PPJu1QQxydkg3deWwMUeyXmAu1++539NBuj0ZdemddPHmXvG7C+yMcuvaGT
	IoAzFJ6KpIL+lp07q81QSS5WrnoGy0ADtx8axbnUOAxGHZtfd70qNJ/cFYPiPtv5s/RtmYVdfDB/0
	BJ9qncasfNI+nziJ23Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEk-0000000Eo5G-3Veg;
	Fri, 04 Jul 2025 15:22:02 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi4P-0000000EmPO-3NaH
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Jul 2025 15:11:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b45edf2303so958370f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Jul 2025 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641880; x=1752246680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=OpJfCaBK7EljszedIji8IvghvfSjej9e/idr+iDsaM4PxMSPOFjm+sQKiXaXXYfSIO
         TdxlJq6XN7lQYZbbAk4CWyfEGghQwmpeQzGYdgdRf4DSlL71uktrFBXAY5VFz29TU1HU
         7dcITdJguH+uFVYBlRf5Vn1v7arANImrprVGrXVp2dlKUpJ73kknCs8cQDrp0YHRK8nj
         cI2iWg8llqxmnewDN8q3CBIQL0Z8pXYet2uFXCPb+f40yNmzMB2/fRRX6II0lHs9owOo
         b0UegJ3O4UEnkJ4uA4V/Wer3MR3Gf5YY1r8ujlzzb40n4lSiknKHNk6PohMddbGVf+k4
         AAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641880; x=1752246680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoEspbh1eRKE7g7m7KXe/ScKkbCYU5aYNDNwW3OSB14=;
        b=hWj1tMdPjKHsHUbVKW4KA08OXrCAxvcEAeoYENLHNc44XuK7juRw3m9AwjHwOW/ovT
         Sj6AYcq+86ngON/uUdFWKY105ck0GjnNxv9Z74Ui/n1Pt+raOjhjpRSVuWlvIHXkXwHr
         YKMdAfaZUF+Lg/rkLmqiENNp9wq10JRzB3C8YbOATwvORdyUzc4ZHXonH/fpNR3nReuH
         cyxF+7hNTOFIVsQIONTGJqotNg7RAwIQGEQe6RGGSl2Pab5fv4oz7rvGm/ugjNCFyHu5
         rhzSopWWUeHzexuqH0ja0AwMs0KCS+/SdnDuOiZRN0e786fY7I7nCpDFp7x0PykUTmBY
         dv7g==
X-Forwarded-Encrypted: i=1; AJvYcCW+mu3QjyP5F1yaOmV1nlBgpD+w9otMuF08+YIwpkMKnntsAn5yVAGeewiGEEc/OehlA4ejK8901sq91VV7@lists.infradead.org
X-Gm-Message-State: AOJu0YzGdEF7jMkZ+azAwbUxhhRoh5/xLvvv/I1MZiT3L8hEpcM54E1k
	mM3Q80EMUW8zHmY3flp8nLi0iZNjFHGmhzy0NjAnzzEUM4ZxUbQY8F2VndYEHoFaxpU=
X-Gm-Gg: ASbGncs8akNHTki/8Mz4oYB1JDgAXnzmrGCFat8M2qxO/DQmxzegtOIkxXD272cuE26
	zFL0GeNdDIMssRYRXfSTrbMwLTGwHgARai0I2Sv0SV8EyxU1y6PmOwGmf8/WNom7TX4aVEyO9jq
	DmmNb3vUmC1Er881EMt6Anb7g38jMMx8YhZWUgQ2iSM1VZqkH44zHgWGBJghzNVxWA585nQyL3L
	o+o1h1riXgS84s9F+/kKm+ocDD4fY4lYz0k9QWdZueCAPia4CIlmccf6ERjqky27G4Nodv6tTRv
	Q8gF+/rd6/UZ2uMg5xgNrIsOF5QN15NEGvRBZWSrsS6DJz0lwso2FfV7usb9QwjKqbYjOlt4GfZ
	xcynTI8pnaL3cDUdHqQ==
X-Google-Smtp-Source: AGHT+IGJq4QH4n1fa8cinoR1z+3JkFuWIr6OSpZpSR6Ueat01j+mEIj1olmOHplIEibyLWK0AicYSg==
X-Received: by 2002:a05:6000:250f:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b4964f8b3cmr2987717f8f.14.1751641880123;
        Fri, 04 Jul 2025 08:11:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470e928aesm2675416f8f.44.2025.07.04.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
References: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
Subject: Re: [PATCH] arm64: dts: amlogic: Enable the npu node for Alta and
 VIM3
Message-Id: <175164187949.2868628.8689971906930320435.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:11:19 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081121_837051_E0AE2CC4 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 22 May 2025 11:29:40 +0200, Tomeu Vizoso wrote:
> We now have support in Mesa and everything is ready in distros such as
> Debian.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Enable the npu node for Alta and VIM3
      https://git.kernel.org/amlogic/c/587c1c00f75565567d1f26a333a3392f7a21c28c

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
