Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50AEC369C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMUwG1CJtVZ/wTkIWPiUdaSVwza4tkrqNP3A7ac0xT0=; b=SpwKQmx/I0EgbF
	UA+OeoSJwvWW8uWPvmDD55irr6CUaH9O+UxWqZkl4X6nevw96OVkoyY5a1WyeDSRtTeKZTY8bBCZw
	KRSH+8hTesdNigjSlJ9RMVvJfsYc55emR2yUV9kvgdp/F698CwY9RUgFGmTivD1cr3baEbVJJF+by
	B02rEgxnQHWlG4hOpMfmAXMNqia+Oi64uogtVKfxrSfHLCdMGDp6bDVShqjtxiezck2LSmA46PBCC
	sZ013CVBkOJe7+JwVFJwWpthfx1qbL05p0iYkGuKNZERGr95zSBdn4/1UaRttluAvWx9xK4WX8M69
	nXulsxZm2YOMX3A3YPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u796m-00000006L4k-0Wdc;
	Tue, 22 Apr 2025 08:36:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u787D-000000068GH-1T2f
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:32:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39efc1365e4so1578506f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307142; x=1745911942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b91x6W4W3YM6MatYMmgJu4q6pcHS8Em6ppy8O0swZ4w=;
        b=BR4RTQuDtq+Hr1IYQ9ILs5JaWufxgBlJKneHWXa2CgPfAG9LI5hhqe1PFodeJYQTFV
         0dG4GOq2yd+r6LgXCnnpozArb+SU3+gXGpBMtLN3zKa19eXZVX6TLyJrraikcIXbwbji
         P3u03u616V+Sbs9dpPnvsVpx7OVl6rIEFQe1Mnhz8TljErKsDgUssJLekrZK92t/dU63
         SW1psNDEHB75SGkZGXaoTQoE3oCAZhkrpgmJPhfVvCqpn5P8ecx7bonMfG41SeAY4QVs
         eGdqv/iUzSR5LXyMUTP7Wjv09wk/MBg0ow9noLQSETjvXHw5pDU4P3uFSqg2y3j0j19O
         x/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307142; x=1745911942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b91x6W4W3YM6MatYMmgJu4q6pcHS8Em6ppy8O0swZ4w=;
        b=Vn7xu9Kb4puuL3/447RFW8WGgdPzafietzTSU2hmHBdYwl+h6oscqyJqYP+vumvz/z
         CoArhuO5J1HGZC21hx8ZlgqVtgC+auSuZaTbktEJJx0dCL8rNDUMtUVXhxmyKwdkDaG5
         NJ2wntdsUZ07B32yt3hHtmaWyRRijBYY2y1+YQNKFI6gutfc8GOinZbeITSr0nWLarLn
         brjdI0qg6shBtFeLx6Uvz4PuecNrY10KKkQmTYzGJxVEb/nv8/2u+qs4a2VOySeRoG4J
         sqlc4qEwmmyYPHZr8cR8bipk9lJgN9kWHY2n/f2OXvj1ofU1ESVSlUfhpuu6B/lGut9k
         GLlg==
X-Forwarded-Encrypted: i=1; AJvYcCXerQKW5UcnlJTMMA1VNXudIj8pXSo+yHnVRMP8YPh5l9kItWwdmEcsnIyP/Aufea1HmkfaaaJp/XZVXvZA@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqm9jHi9ECa7Rn9VTNGnb28kUFNebrDQzdQ8rJLMtPBzxe7Zc
	o6tK59RISq84Xq6wIkoQ2NMKIz7YjT4/JQmTUexDgS6q2OVH/13tmiqG1uGSl6A=
X-Gm-Gg: ASbGncsKhgK8qKOhxbG8pHc8rpWVbHugeGdPopZqlCCHxIC0Yty3WISW0m9+cbBAMt1
	Ziz/Q3vRSwAdLCUSp7qS13+xyUzRpqBzVVsbe7WBXu2xPKDsHTtVICjbbBPW869WWfthwPIcwJB
	4on3iMZ0bOyBZS3kd+BXmbxKjc0g6eC+0Or1I/ZN8l+GdVRz2Kq7j85/ST9CLSOS5KnHM85rC9+
	ObZPK4bsVcTaHCZhO9byzhoVRYFR8PRIg9lpkLo68ObGRCQloGHv2hsofLKAQrW+r5iULXDFFlG
	h4xdG0mBAtj9FbUR9sXPHddYnOGseF0N74DapeMq899POXbKIcCbEVGKBc2LaQ==
X-Google-Smtp-Source: AGHT+IHVx3fFkWbafwHn6ntKq7zb+0naan9uw6HPP+RnEoxKfpoIH14Qff0Qd5oTwC+j37n0ll/b5Q==
X-Received: by 2002:a5d:6d83:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-39efbae3fbcmr9450832f8f.41.1745307141909;
        Tue, 22 Apr 2025 00:32:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43ce6bsm14346607f8f.55.2025.04.22.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:32:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/7] soc: amlogic: clk-measure: Add
 clk-measure support for C3 and S4
Message-Id: <174530714130.2805699.2160081120473599366.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_003223_390935_102C183D 
X-CRM114-Status: UNSURE (   9.73  )
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

On Tue, 15 Apr 2025 10:45:23 +0800, Chuan Liu wrote:
> Add clk-measure support for C3/S4 SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[6/7] arm64: dts: amlogic: C3: Add clk-measure controller node
      https://git.kernel.org/amlogic/c/72e295292d3d1522d3ce628d07ef6a924e112b73
[7/7] arm64: dts: amlogic: S4: Add clk-measure controller node
      https://git.kernel.org/amlogic/c/0d057d35f3714e6786013772c830a976c2530894

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
