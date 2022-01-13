Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9FC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 04:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywcy0hT08qYqRuN18Z4PNWuOeivO6FJskit7xVHfCuE=; b=3V2XTCMp9L9eAq
	V1lHldxTT6793hCi6x7OHNnxX1UZuTlux7OklqyUPtBO8XtDtjVBX6ssqZ5ZqP4u9Klvwdx6iVGaw
	mGVwWJEFM2aKUtpigHl/y96AExsunLRqxgGYG2QZk4HBoA+/Poixi07JKIqp/KzQA2l1cSi1gzvbw
	rhDNujHyPae9K+QRMJdZyJ0kjjw62r1NPA2rztDh9qKf3rsJDmIoJIYG2koUxzZ/s8S5f58aowrtm
	q1E6LphJbgclpJGbrRaMVP0T1QDcLzPFYZUFUratLDltqDs0VAvUQIGCjBzNL1A/azQ6SKeqJx2QN
	BC7E9hHaCZ/gIHcrbTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ret-004ZPI-RD; Thu, 13 Jan 2022 04:24:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7rYe-004WnF-Of; Thu, 13 Jan 2022 04:17:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a18so18265674edj.7;
 Wed, 12 Jan 2022 20:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=twLiFQrtbAYLfqOjLvfLPkX6xypVZRiVautRxIHyT/A=;
 b=c8Kj4oWAQVw0mFePyWCPL8+5DCzIwQn7FRB1qQbiOqJFBRyOXcYne+XDoUHL+cTrik
 JaOZBzxOaGHAFR3+Ok20jQ+CndVAgLBzwf+wxFY8f7ZWhOU6dyRZm91/mUSVwARAIQDS
 WMDxOahdIqJ3KHj3UaDZWQ4tnNT6IB8Ad+etYvZYoTewo9d2oNAWevY0qemegDbeBX1/
 fhsrMdHge5yUQhTwMeCQfb5VG5V3m6pfxjC7nI9EF2QHC0rGPqyJxzgN8DUWDnx4zJ0D
 baDttos4NNTcPvDygTxvBfUrEFEACVbgyO0yxPXdoAKAy14aW7mnL/a3coITkLT181WF
 yDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=twLiFQrtbAYLfqOjLvfLPkX6xypVZRiVautRxIHyT/A=;
 b=GY+MS5Oa9APBA5Qr5t6Sz4fMsRg7tVIULh5nj20984Q9bFcO5RghPXJUTtX9HJwZxK
 hNqjoVU/B+H1GZ+2kzUKyifvoJ+2RmtP9OicvhV5Sz+0hqa439sKaaTaXdl0LlSnxj5f
 L+InHgkat5pCwhdMl0KvaBEUk2IoCsfzX2W1aJ69oyqSMupskiGQqX01GzkWJAIbHuac
 7gu1OmtZ0pjV4ltF2Vq3ffl+CjXbzhvtB/PATzGHW4MCkfY97yvBUY2BUSvAcpIxVdWJ
 CEYir+ffQhIQoR0dZ/4wtoivoj2cETERCx+48BMd1eQ9Z5watbS31DybN1+5xzcaQRpY
 3fdg==
X-Gm-Message-State: AOAM533hStU+hJsfsaWXnmE8nyPYMT4qkq9ZM4tHhnol/6SfU6HdyKkt
 QEgNHI4sHhh2pHZ9b2870i0=
X-Google-Smtp-Source: ABdhPJwHXyyikak4mGI38dwfDFK/WiLjVYqkErNhxTzcCuRXPUx3hM6QBBqmMmKClFKZxf8S4JQkew==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr2152409ejw.652.1642047470421; 
 Wed, 12 Jan 2022 20:17:50 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id eb14sm651822edb.16.2022.01.12.20.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:17:50 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: minor P212/VIM1 fixups
Date: Thu, 13 Jan 2022 04:17:43 +0000
Message-Id: <20220113041746.16040-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_201752_859373_F55FDE44 
X-CRM114-Status: UNSURE (   9.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The P212 (S905X reference board) dts is used with a number of no-name
Android boxes that follow the reference design, and users had noticed
that BT worked but WiFi did not. While investigating and adding the
missing WiFi bits to the dtsi for testing I spotted that VIM1 inherits
from the p212 dtsi and has the BT node duplicated, so we can clean that
up too. And since we're tidying things, the pwm_ef node can be moved
to maintain normal alpha sorting.

Christian Hewitt (3):
  arm64: dts: meson: add Broadcom WiFi to P212 dtsi
  arm64: dts: meson: move pwm_ef node in P212 dtsi
  arm64: dts: meson: remove Broadcom WiFi/BT nodes from Khadas VIM1

 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 19 ---------------
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 23 +++++++++++--------
 2 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
