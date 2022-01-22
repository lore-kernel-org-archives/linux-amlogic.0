Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A742C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jan 2022 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYvZdzm96XHxHxKPiKNtyH7CC1ck22ib1NaTsZ4c/es=; b=MbJJubLxLp9uwE
	MuFnGgWBx7wdWiP4Dj9uCyiNYiQbjNSailkdLe0h8f6lJIRPyQ1Ii2cftIICgiI0AnUNUEDjd9aCM
	th0+R7NGohoOJynVFqqBtHMRLzVXzW3zrUbD1O8nLJhA88g0jCKtfozFsyHG32FudwXOraE1WIjzf
	FZaKi2K15XTJ6eI7AUzIZIUFxjBB71xqvpdkYkPEJwtnX80MfCb9qvrdYFb7MIqWWSz2amos+Uu89
	WcpWpjOSRcYQC7bUi43fDROmZSbWE5JrcUEGGEQCnjYSY16LBEepmAbeC4ukiW1pLTIF/J30UsyUy
	SFoxef9KXdOjybJcdqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBAt5-00GidM-MJ; Sat, 22 Jan 2022 07:32:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBAsu-00Gia6-8l; Sat, 22 Jan 2022 07:32:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so24099956wms.3; 
 Fri, 21 Jan 2022 23:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=eLJ1e0t7pNb7/jsmEfgWimt9GUNNFZcrb7wADH/t7SE=;
 b=bl2Q4lLV4EuYLIeOTG8HyAaoPmk6wvVq5hZGZJQf8OGbqPct7X2b2Afb2Nm9M/Inkt
 zqwcLuz1yuTqFCJ0bQDM1b+9JQ+2Zw1bh4Uy/K1G9Vtn3Y/T9nzSxAGJZ3LdBq+DWBs6
 G60lBnB/sVJxvHNNbalhh0uOOwSKqgXn4ENyFEO4WGnkuVBmOuxH51nTtB5ewzUmJaW5
 qtORYOG4sJqoNcnFkLE41glfyilh2b0fDmy1cGx3S0wJpyVll1sO7nm44XAHmNl2r9f8
 Tsgn9CI2p3toUmRlCWamjTPL/e+ltWjDI4B0RhIycZ8AnfIM6lrUMDiIciWjKt+nslgY
 S7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eLJ1e0t7pNb7/jsmEfgWimt9GUNNFZcrb7wADH/t7SE=;
 b=cDRtOCerWwyn2wjgo4R62FcTRWtLi1E3YKU3VjGcFnj9VTvNXnHdi24lvS/h75GL5l
 2y6J8OqEkcRSCTh0a14OPeqJPk1rlfvji5i+wiAp9hvv0HF480nSRbni4WMWCPkyyqhv
 jL82TwAeul7k/6HWwXAB10WCZnx72Q5XNKNG56+ml1zC7XjRqVKfh+MbdX7zEFRlwEZg
 pvhrRU9SjnXc6CMKw4Atpy9ZPEo0oMNI7pQjUG3hwoZ05pX3Fy6nVHE6Sem3uCc+D0cK
 PwXvil67hWrUFFC9tPI9JDGdXBYDd6UmN8Fbc2AygUxmfFzp5nkyw63Aszuc5D+xj053
 Xd6g==
X-Gm-Message-State: AOAM533HVvkRYSLAOcGxDGRqhEjmwOj0kEkGolZmoAwIOGl9Tsh137WN
 K3HIOxvzO5bB5k/EGRRMlqY=
X-Google-Smtp-Source: ABdhPJxETDu2LPO+h9VYZACT8m+jzuSr6/A2dMQSNAwgOT7t2iW47JBiA/7I6Nrnq495CccE0/Vn9Q==
X-Received: by 2002:a05:600c:3caa:: with SMTP id
 bg42mr1667733wmb.193.1642836745883; 
 Fri, 21 Jan 2022 23:32:25 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i8sm8970485wmq.23.2022.01.21.23.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 23:32:25 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 0/3] arm64: dts: meson: add BL32 reserved region to Beelink
 g12b devices
Date: Sat, 22 Jan 2022 07:32:18 +0000
Message-Id: <20220122073221.2398-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_233228_346428_1A554D54 
X-CRM114-Status: UNSURE (   8.39  )
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

This resolves a long-running issue where Beelink GT-King/Pro and
GS-King-X wedge on boot or shortly after when booting from vendor
u-boot. In some distros the issue is often reported as triggered
by large file transfers to/from USB or SD cards. Reserving the
BL32 memory region prevents the issue.

Christian Hewitt (3):
  arm64: dts: meson: add BL32 reserved-memory region to GT-King
  arm64: dts: meson: add BL32 reserved-memory region to GT-King Pro
  arm64: dts: meson: add BL32 reserved-memory region to GS-King-X

 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts   | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts     | 8 ++++++++
 3 files changed, 24 insertions(+)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
