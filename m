Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF33C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O8A3T/ZM7h5KQFytXqa12caSYfKHQ6u3aM0qD0NKu1U=; b=sNBc5GzJlDGQ2T
	afSap7gmA3RVkYCNdYcux0c/XnmlbPIup8Xy4ZEKClc02pp0CLVm1RiUTVxrPi9zCRJRMYpE5iVE2
	l4C1lR6pYtn0GRJZtLFlLP0U+7mSEHxlstyVqQ+Mhfv4U0EKviHdEwz6MykXefwKoKhYZq9On3iDB
	KCDIFmsjQtgXQ7FwOdPMLy9RaVO8Qa4wgNunIsn4zTe+8dQEmnTwZIyzUicGjJK7431I/SzoMnBtQ
	PGTb9mXN/8lieC2sAq6xN1nIlUEgo8PH5ofDQpqe1L9ylYFW1/72AvBkEqOdO9FgYx53elGP8YPR1
	8N8l9ujxuZ9zJc+FiT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqji-00G7ig-NY; Mon, 23 Jan 2023 06:55:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqjY-00G7fB-6a; Mon, 23 Jan 2023 06:55:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso7753606wmq.5;
        Sun, 22 Jan 2023 22:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ7pZzP7l4POQysOuFD6RXLwFmeQ64kf4EXzL/9/vCM=;
        b=SZB5f+BslCr+6rnD0bGuhWHfYC/po5PbklRCKScbGHMO0v/+I0mDslXhXkgAcZmBnH
         72IEMHTBkvjUwP93/p28l8dU0+rVyWttiSgV5PpcNryp+ZTeaLSONqb5ZlBKP79CwMeg
         5ZS+6HdQEJyGFviao39g0tKfGHu5gz5yrD23BvA/VaxZCl05v0d/efDW9xjrfSGioF/j
         dOErQb/eVijdT0UGYROqjN7uwaAAYjnfXYkmX+dbCzei+x8MDEubZi2vqyb4HqTcLWW0
         galk8SpP/h/Ofb/i7stpeFlE1NGhVhBfRe0z5lStBk6ntYjKZ4OEYG5lxYO5nVbLRauf
         uTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJ7pZzP7l4POQysOuFD6RXLwFmeQ64kf4EXzL/9/vCM=;
        b=bcdDxLSgDq3mFEI09EcOfQh9acO3t0kpuYSR4nUB7V3KJ3V5tFFVkIQ5u5uK37L8QA
         Nks9cO4phXF0rvP2B5LojwGYai1VFhDiW+Jd0LPVIq4zB1/6J05OZ0Bw8Q5E5K3iycDZ
         PQ0AK0E5Cgn8QnCorM8uy1gwXLhTEf7Ysk2nM6TqRme66zy+qemzFpEpHqHIPPm9XOB6
         FJX3UPg9iqN5D7rY7D3++ASIkoE3CQs8Y4KTNYPuYCIF0RFLpwXJuOaEubAlBvT7HjH5
         vr6kM9yMS48vOgVM4RV+fbjDtMwgrWI0GjGOGeNVxM/zYvfp6N3F7IRhq5uzBHLMW1wC
         mzsA==
X-Gm-Message-State: AFqh2kq3j6lopm7bahBPmSwbVkuPJROQcPkM10ECa7NXCLnyZt8ttaWA
	73/7q0bn8VE05iqdJKW/EpQbIbvZESOHzw==
X-Google-Smtp-Source: AMrXdXsRjRl9GgZhb5JHClnfyLweMYqjELAUA0MevSUcuGPjcWZEwb2kQp0JOjfWeEDMV8jXZ95J8w==
X-Received: by 2002:a7b:c4d0:0:b0:3d1:f6b3:2ce3 with SMTP id g16-20020a7bc4d0000000b003d1f6b32ce3mr23724781wmk.35.1674456909143;
        Sun, 22 Jan 2023 22:55:09 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id az22-20020adfe196000000b002bddaea7a0bsm25948365wrb.57.2023.01.22.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:55:08 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: meson: add WiFi to P212 and cleanup VIM1
Date: Mon, 23 Jan 2023 06:55:01 +0000
Message-Id: <20230123065504.2669769-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_225512_284137_362D0857 
X-CRM114-Status: UNSURE (   6.44  )
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

This small series adds WiFi support to the P212 dtsi then removes the
corresponding node from the VIM1 dts (as it's now inherited). Also
move the pwm_ef node in the dtsi to alpha-sort correctly.

Christian Hewitt (3):
  arm64: dts: meson: add Broadcom WiFi to P212 dtsi
  arm64: dts: meson: move pwm_ef node in P212 dtsi
  arm64: dts: meson: remove WiFi/BT nodes from Khadas VIM1

 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 15 -------------
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 21 ++++++++++++-------
 2 files changed, 13 insertions(+), 23 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
