Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TG/vU0epaUJs+F6XTpw3BY/pnm1Qtvl6j8IvntqnuQ=; b=VwnctX2m5q0rkN
	HNu57wgql4Mo6cQlWmeHtE1fIKc5Jejvq3JIJ6OshoquDc6Z/aZgZPe+3x7WS1pQrjqhjU6BlYPnT
	BOfzu6wTxSzXRMS8bHyN+C5ewlkQxm8DStK87/FG7ds4DXmsKJIAxrLLrflTncJ6tXAjbOMM7/sHh
	9qpGwRG9P12dwKPXNgY6QSMjTw0jc6yYPaBSeJ5E1LtzTZwXbLIT/78J1Z37lg7zNU8v1PeqyGMeU
	O9cebjQhOMyi7Qpyrwdi5DZQD8urZbGPS38sBinvUo1f5W8NjfWH+rBySfn3bWz/05JeWrg4kLbuy
	vXtF91xC+WdCwUyEYQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI6Lq-003OsR-TJ; Thu, 10 Feb 2022 10:06:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI6Lc-003On9-DC; Thu, 10 Feb 2022 10:06:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id e3so8666862wra.0;
 Thu, 10 Feb 2022 02:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=FPD4xO1P+78Y/NZipV2Yc+8FswUAtN3q8mItY6ywkSw=;
 b=QmQF9NFofioCPqaRQ/xtXqTWiKFv4fISuIYU/wppTpOUOYT2oVFrmKM30hyzW9XOXF
 weBSfLkDIzwC1gq4FYIaxqJgEPcSPslh2ZFFj0QKwr1dZpdkTG4mY26D2d5f11oX5Z8g
 rdh4qDGsYSsM1lpbHauTAINYBvOoRf9FIJaLrvgFIPLuqVJ2so1FhC+DKdkTa+naJUvg
 /VVYAeZUAQ89iROPos+uEAXr4t5L3DVAJfZKHVgqtfHnwYAqBayZAnIDILP3VHZwfoRw
 yNdFl0/SYw3wg5pVhC7EA/ND4xvWLyL2c2zMbD7GLBUCK4Ov6p4pmxrvUsoBRwFtYNxS
 A3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FPD4xO1P+78Y/NZipV2Yc+8FswUAtN3q8mItY6ywkSw=;
 b=OSGfpFCBThRMRxrw5kkq37fzmQ2yFugb6DYKdw7fBQ2i8YOl8Ry4kz/T98Z57vd6HJ
 h6QLOvvlADDLB7dNgfpDfOkeXLeenDdT0P/TKPsa0LXK4WRKCflJNUSamKxRrj9tZCHa
 akqA+8OyXBfXCwRyn0EC6+wRpqLWJY0j4Lsb/nfl5ZKD/1ajdDKcYVLNN8Xoc1FNSA3H
 EXLAlK8PLl5bek0/v8xyNt7wx8qvlxE1U/1Y8ds63TcRPHumK/0+931cJZx8bBQrqm9+
 hDmwPTMp5q9W2OKLrrGAerkRyKQ/FLiyJ2CFuStWCPHA+MMJacOOWTd9Y4mCxhaOPjGI
 k/VA==
X-Gm-Message-State: AOAM531HqbWT1TSKmpbua81p6d2/Q9kz0OJB3Rfu1rjcqVfOUP2t4g6n
 rvfQaKx+b/xStS8sJrgIVEM=
X-Google-Smtp-Source: ABdhPJz28f2M3YAckbDT3m5BYofZoOYoV0Zalqy9f2eHSZ/BpSZ+pd3QtbiwxftomVxupxK/KE+sow==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr5491755wrp.698.1644487602942; 
 Thu, 10 Feb 2022 02:06:42 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id g15sm18817494wri.82.2022.02.10.02.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:06:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: meson: remove CPU opps below 1GHz for
 G12B/SM1
Date: Thu, 10 Feb 2022 10:06:36 +0000
Message-Id: <20220210100638.19130-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_020644_464654_429973BA 
X-CRM114-Status: GOOD (  11.91  )
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

Amlogic G12B and SM1 devices experience CPU stalls and random board
wedges when the system idles and CPU cores clock down to lower opp
points. Recent vendor kernels include a change to remove 100-250MHz
(with no explanation) [0] but other downstream sources also remove
the 500/667MHz points (also with no explanation). Unless 100-667Mhz
opps are removed or the CPU governor forced to performance, stalls
are observed, so let's remove them an improve stability/uptime.

Numerous people have experienced this issue and I have tested with
only the low opp-points removed and numerous voltage tweaks: but it
makes no difference. With the opp points present an Odroid N2 or
Khadas VIM3 reliably drop off my network after being left idling
overnight with UART showing a CPU stall splat. With the opp points
removed I see weeks of uninterupted uptime. It's beyond my skills
to research what the cause of the stalls might be, but if anyone
ever figures it out we can always restore things. NB: This issue
is not too widely reported in forums, but that's largely because
most of the Amlogic supporting distros have been including this
change picked from my kernel patchset for some time.

[0] https://github.com/khadas/linux/commit/20e237a4fe9f0302370e24950cb1416e038eee03

Changes since v1:
- Split into two patches to allow for separate Fixes tags
- Minor edits to commit messages for brevity and typos

Christian Hewitt (2):
  arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
  arm64: dts: meson: remove CPU opps below 1GHz for SM1

 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 40 -------------------
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 40 -------------------
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 20 ----------
 3 files changed, 100 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
