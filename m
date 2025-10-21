Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8BFCCD184
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbiQATBQ8EzqC8z356VvgqvWb+99kTkXlMi7Fvi1C+s=; b=nMU0aOPyi/YxWB
	t/N1XV2IQYwtAtl9f2PWqic/oQa46kH7VJ6nYCmOV95DYZuVvk1iQUo0bauLV6B7fewXuozB+CO10
	PXxymR7ePfLEzKxRhZA51xh01yY3QaxgsYttTyyHNwrz6X3X0eHjauRoQjnUugR+6vT8yrFhlfkpv
	3INUQO4De83nxLwf8rH69be9BSIbI/T9JlIPcRkSIu9O0ycZGDlgi5OLiI0qcvGV8fpMr1PHO2ESG
	dwE0mHyQP+nhLZJk75VKrkYn7cynqGfwQcnnoGYJPxYyCFiW7jsVUNrvvZBrmsv43rTRzZO5vZV7b
	2npEtxqAKomtPU24DbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUr-0000000GyXK-3TbY;
	Tue, 21 Oct 2025 12:29:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUo-0000000GyUz-4BHN
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 12:29:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-427091cd4fdso2652842f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Oct 2025 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049785; x=1761654585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw12B7KdWN/wbxxijDvUQZ5OrO1aWstBkEoWMIB2hXM=;
        b=Mm28XCfaQypUwvNCm/hTp7uST/H6s9o1y23ZvaYMYgQGELxh9Cm2sygCr6g0lUAnfQ
         f3CXzYRSrErCrR2U+L1hmWJg9XXlvyX5VzJ5oNgf7ivOWlsclnf9Yjv7ytk5GITDpUtk
         k9kYdKBVejWuVl8Y7qjAzkvFoMMRrm2xSKhQuBwVGU5DLm4beDwOs7BGDgNDiglE84kd
         Q8wEkjXN03AzSlpz1uHBSmqYEOrimKN0l/bZ9TRdg+hj0erI/C/D4XkZ5CO/tu8CwKa9
         y2ZGI29cFNsVk2cqEbBJazSfJf54U6dzyv2d7EtZ7JhgFs8DXOo94FS+knRd5XdQ+brN
         lgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049785; x=1761654585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw12B7KdWN/wbxxijDvUQZ5OrO1aWstBkEoWMIB2hXM=;
        b=YGK6c8xmfk1JE9xwbi3JSa9Kd2fGLtPlofZSYfTlqoDb9vpCho5HaUgC3STpi8WEg9
         2k65234wBsWcZPrMx73VmhhajUziONQceHC5z+977DbNC1/2G8nzTvfU5Vj0zFAykUyP
         RPI04C4ZvsoVBLyRqXyImliHc2zreJegtM3UC2BJx5WSLgD8ARWO/+kK1YwvAnNnqRL8
         fNAQWA6Tv5MsfXPOoxpY5BR8gcuOOGSFQHD3DHtLotNsCon184AuBLrqYEzdtu5pmfeX
         itqWzodFLfOh23JyX+kFZZtwrEuOiUiziA6Xkj4BVwu11+ZXbOjtgQ0p1q8S0KH1Ovy9
         iCyw==
X-Forwarded-Encrypted: i=1; AJvYcCWlpVvjuIzrIc2fi6jEN3Houe6EdXymWXvd6aFcqlOJKBFZD93NSBKKGIhjgE8v/5Zjbxp5vb4fisKZPN12@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKk6FIeJKOXhbNoJnz3/XoEzItgmm4tv5HUVYUlRInOTVdMHU
	ROtDrh5PM/273+tXemqPJCgR+rzSCPs1DNqT39Sf1L6H1RkmosigJJLM4gKZtERzXHdoHvW0dLV
	Zdrwx
X-Gm-Gg: ASbGncttfFtKjxQFuSa8LkIUWwsTFQ/P8rKbgXUB9ywqQMKdQE3bUXYKyNZZNUicJLc
	DY9RvxsVw0Unw8mg36XEv+ysnzVACqQu1Ics8dxh9bkFVveCn1r82yw0a/TmjdbpraVn+rBiG3g
	14hVElONUaGuiUQIbRgf9QqGIhIstM+6WCgqHD0y5hmxwjWJ1SuZePqdxRWbPKBfQbV8WP+vL5O
	hXNok/fWMTmpkBrVPvDddrGb4tx/yiC0SxAZIq/1kEDSI2pGUJRglI1O1QiEiLZRDJF0RbX3Jqk
	2XpaLZQ2fe3gbHmKtEzAv+JU3bMsqMPgmHuOU0hyLx+YXWjKBesP/4ICWPMh8erQdBDJGinJ6dn
	OGNJ8G8eWY9tCvcvSI4NrCKlkH+27SGFCFrsz8+qgTo+1PM+mYpGH5MmVDvc4KylcQBuSpZt1T8
	dJO3hYlihDfKfeCBV5Po2600/Rj4tLmQI=
X-Google-Smtp-Source: AGHT+IGetap4T/Eh1Z+oljdXnfqlancpgAhNO6qspGOxItJqX1hECPXKuLsbg0/AZayCnBvDbJQ07A==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr13782919f8f.33.1761049785129;
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm20057043f8f.17.2025.10.21.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:29:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix
 TX9 Pro
Message-Id: <176104978445.3075289.8934335794181531302.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 14:29:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052947_055448_52A529A1 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, 27 Sep 2025 12:50:05 +0000, Christian Hewitt wrote:
> The Oranth Tanix TX9 Pro is an Android STB using the Amlogic S912 chip
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
      https://git.kernel.org/amlogic/c/beaea75ddc2a483e7b2b08a040d418f323510316
[2/2] arm64: dts: meson: add initial device-tree for Tanix TX9 Pro
      https://git.kernel.org/amlogic/c/afd1e16c6d3f53810ea29b5269dfcfc233e9b6b9

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
