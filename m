Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0FCCA1013
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk7LGk66MxkLW6ygqbqKZvdasPo9F6b3aF3eGeG62sE=; b=ogObKIV8EK0HXy
	j9mPw0+O14xNBI+qHMITsEqhCSDMESGRM4YEMN4FJEiUPVE/2Hm1QsIWsB5QG/T2hvrHw95GER5J+
	CXL8uHSwuCQ3/GaSeq42+WlvQhOrKiAUxAnVfdDzWHm7iph/7g7uxQmyQgSnrogw2nfk2Md1EeTFO
	QQzFoUa/X33J+g/X22iwgh0xBXPyKksEzmdoHxN7wAJGLmcGn/7wM79UAfIXn+TWI3eXhHJLtLZ3A
	dSh2z22zDk2uQLEt7CgEifjqpwZuBDqHB0EJqDinHX19VrhbCxTBvyPZeIQIgQp/KWjqd5edv44+7
	2XQlitWVyrkdlmx5LRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCo5-0000000Cus8-2QHJ;
	Thu, 04 Sep 2025 16:27:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA0u-0000000BtIA-2goY
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 13:28:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45cb659e858so8779075e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992511; x=1757597311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPemxXw+0FJhICaHUSL6epgUI+v6RGxIc62gtZdQfSo=;
        b=Kb8YOh0g7lFeOwLcvkGVJDu+50wWhJDajr5P5Ui0qd37rnzkzn7ZTncwLcKxAVWUaf
         b5ziGwdbSgRF5G+bEiXbneLSNPApRhP0jk1cKi33tdnqTHLi/HMg2VSOVtWjx+WXZN1v
         k8ZI8eaZ9HJUwbfB6vYY1+OOnDf0RrnWozZ8QmOGBGrZQ/wuHrP9R6oYHKHAJxW/fPV4
         ex10fuFfK7NysqbYIXvbPx1OpuBQtPVCYWfCFeKCvmcEZmuQKXckKGQs2Q4TNLB6EaSv
         qBm0OyFWx9K2KN4UjngVe+EYYQZhkEVQfJ5hZxxhdMMfSnEPkY0oMWC2/XzCsxtChJQN
         UxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992511; x=1757597311;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPemxXw+0FJhICaHUSL6epgUI+v6RGxIc62gtZdQfSo=;
        b=uMy2eNxVupFUKiFmV6f5OgPdW6VyGiTDnnDonNu2JztxCQHptv/oFPKgYHwqZ/4RKo
         z/yIHxn1rzY7FqMMyVmAt13xd0OALJSTLUJZ4nANQQQ9FX4A8o1XJCU0QTAwSPnItSGm
         R+tFqRKGpz8ktvluDZWYb5y9+ebucnu9ysJvpBJsAQkLeGNkBOUqiMRVCm6i7QhQSP0d
         PXHz6piXslBT8pxrtxb5zNf5uZQTgBjQWpf7bf/E0/qEdqxAFyXm2qhmEDRMI4pee1PO
         kzWwoWBUBGorg/zzBvdU4nzM9zCOEaLCoWnw8bXgpv7cooQztoHB9PZqSuUdLWYTmG7y
         q2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4bCdDWzOV06WjPYaE6E43QXyJzMkwLurzZW/FR5QAcAzskO+UCKnSbD7zqXoS/94bjyFbikXrwHiZO3v1@lists.infradead.org
X-Gm-Message-State: AOJu0YxmZ/a4dLFjACFzeIgxwXt3Ojr3rdnpDVP+PSAcrblKazZ1cLnV
	E4DRikof4EorsRJTUeVRYXXx+eTfkdge0bpCrb4OCUkZMj1ZWT6D7TT1h4AayWbPB1cYh7ufjjZ
	P51H4SI2f6w==
X-Gm-Gg: ASbGncshsLhJdZunwMCXZuG8rMlfiwVP1c5Lontp1zUMszxQGqxUnf7NXdH06ejQ6xa
	buC7jQf6rGB3ygzRRskZzwT5QcRWpxWNpEFvMJvRv/48/C/ZxADIJyoCuDXBYY8+IZ/NOevw4Ak
	iMyxmoE9MJcxl0T1S0/XY0y96HoCcAlN8Q3kdDkDw1cCjsI7d8VGhxcPtZ3pIITM1+HJQFjF+Ob
	CVxGgTP88eLKkHNHYUalx9TEv4RZSAc2/UO6GtNnzKrvpE8f8w5Mkr8ObOLdesGKEGjIqZCKYMh
	J1bZPiZJ7ceSI1BK5zK2q2v9na97cFNz3op1h2beLSXfI/BKofaWpQmXzglQ6OIElN2jdkukOLR
	SoWLKFxhQij7dVx1DqDXmn5oiGu7J9g+IYYQiUBBEWS0=
X-Google-Smtp-Source: AGHT+IFChDxfidjmo6oLli8hpEv8BHitZXQWhFKQ0sFyaxZOzOcsJqvu3t6i4m2n6GGf1/m4WMbRVQ==
X-Received: by 2002:a05:600c:35d5:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-45d030f7fc7mr32582245e9.19.1756992511081;
        Thu, 04 Sep 2025 06:28:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250505143700.4029484-1-christianshewitt@gmail.com>
References: <20250505143700.4029484-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
Message-Id: <175699251033.3374853.7119442456595565513.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062832_693030_8E5ADF9D 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, 05 May 2025 14:37:00 +0000, Christian Hewitt wrote:
> Users report being able to boot (u-boot) from SD card but kernel
> init then fails to mount partitions on the card containing boot
> media resulting in first-boot failure. System logs show only the
> probe of the mmc devices: the SD card is seen, but no partitions
> are found so init fails to mount them and boot stalls.
> 
> Reducing the speed of the SD card from 50MHz to 35MHz results in
> complete probing of the card and successful boot.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability
      https://git.kernel.org/amlogic/c/916fa558cb27182933fdfe82d6d84b437e69349c

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
