Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407A3C001DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy2JNQkA4AU7TNIfPpp/sOL42AmZiuDATGpvW5DjVgQ=; b=jEhBwdWUnrHCPR
	B8hkDMiU34TtUvSQfXN9WsoneSjB8yWKl+KCJ/go01Bs427fSMv5r3iYtiud98hs+aisp/ZCv8GEf
	l16Ijli/EpfQ1jYgw8oz7JPR1EQo6SS13qWujZYpRYmE1ricQEzT49HHbgN0t8MsCTW2TbwC9ppEA
	W5tBcFq493MmN9cqcOC+Sp5ekL/qZ/sG8IDbca7ThOVjhVxb1GZsOOYvwA5AW9w8weGIm8bEGZnAu
	8TChBFKkIxvb0WsuYoHFV+5hDKkIsDAXAkDRchPBzvEQHe0BXZtOms5DARrs9jlUgdXCy7fo7oVwI
	7eVxHrz42ATBZkdcK2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzj-00972J-1I;
	Sat, 15 Jul 2023 16:19:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzg-0096yv-1A;
	Sat, 15 Jul 2023 16:19:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DADDE20002;
	Sat, 15 Jul 2023 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yy5aynzT+WX47xT4QRYlc8ZdbQrg+GOPHcIEhZNHQP8=;
	b=CO9KYMG5MhWX4NDpLmVQqrZvMM2IyafHPB/Gb9T86PMy8Xpx1Mjxx4qFb96sDcvuGzqvNA
	vulH9EGwQl5cTNGk9EHGeaquo/lrC+stzCGHqsi60qOAP1t0twJqmEroide1k15NTCtAmL
	w8xQlhkUZqkIREHdGtNH2PQLDvFDUEUJACyyH8ufvkvbMai1gS/a/nCUrNxBDBAk5MnFq6
	Wyx4uSHU1elq9IE17xnaDkXCtXBGOYVJglXH21c7zMQLkW0OOU1zJ1Qce3UmiPPVeOqY9m
	c7hNQqmo9a3iL7PRQLP5aMxPIEt0rTwOBYqg+OxaZBUU5p6eK0OUP87wEZbJKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: nand: meson: support for 512B ECC step size
Date: Sat, 15 Jul 2023 18:19:36 +0200
Message-Id: <20230715161936.20703-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711122129.2635558-2-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c3519aed2a3faf77b66350214fb5caa9a0905888'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091940_527592_575E0658 
X-CRM114-Status: UNSURE (   5.23  )
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

On Tue, 2023-07-11 at 12:21:27 UTC, Arseniy Krasnov wrote:
> Meson NAND supports both 512B and 1024B ECC step size, so replace
> 'const' for only 1024B step size with enum for both sizes.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
