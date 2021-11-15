Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3B2C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D5761A82
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6D5761A82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pu0fCxjmuvWGg1+jKasaE4co9d3RtyK4YLeYw6r2LOc=; b=skZl21ojO5JQTw
	K1uH8Kvn7AHAQJ482cOgw7k81dseaECSM6P6qqKshOnmobW1osSVjcbsImGbu8bzU1D3xXnhp00Rm
	5L2QCRFvam/K0EVpx2eC1QH1kBcVSXG0QUUVTw9YzN67jKxMj4AnIX3LyrRcY2kEXzf/HctRl1rJf
	1eKdl6w1PTIovR+yZ+Rj0xWx6B2JOO8XmDRv/B+b8+/nevR9UxL5jiUJm2izKbGZAYWCN8o73ROGd
	eLCGfEhSRwaI0MYpdxZyBA05cCHfxNvlGIfrN4SHyjv6xnpl9pUXuTuwR++iLUk2ixI3dgvZmpU1K
	7F0iG/QaT7aMK9eGjvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYqQ-00F4bP-L4; Mon, 15 Nov 2021 10:04:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYIa-00Evi1-Uc
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:29:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id b12so29348611wrh.4
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wemttcpB8qRVZjoDeMFbFx9gpf+d7pUwbUjdqvfUavQ=;
 b=pS04qFqaJr37QRQFe0Px3b1LzUEcwy3bjlk7Dqu5WpGuuYw1bU24JhDUK6e8RvBxUU
 xxU2WWlbW4T42PPTw8Y4hWDVOZ+xqn8+9TGlNtktpJc6aB3ACBIGIwbcGOe62EhV5JtX
 gtvPrWpFLs3wMtDDuuTkOrpOXuEaMmvn94y6Rd4JfAJGOm5wgDcEwCkVsA5okfnCbJE5
 STTZ5YMuhtFT2fgUribMRSijIOW35HR0VcOuD1/itOP2MVxsewnulzK9W56ghHMpzGqE
 Bzbm5KcG7bySa+tau5TFFhhPZfW0heTrKYSV02X58r1BFrRHosVf7EDvHI52wCECR7yY
 7c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wemttcpB8qRVZjoDeMFbFx9gpf+d7pUwbUjdqvfUavQ=;
 b=B/is8/jE3X5qTEUAnq+gDgqvZ5QtJi8wDUkXmfwUZZPsTMF4u+NDtkuIgByqZGisej
 n9zULZQf3G2TORD/GHNm/VR//Mt9TutxIcEKyIor1ShllWzHhYx8mX1A61nF5wQERQ9Q
 tf6diPSFCDLy21zdHflLpzfqVoAR7t6timHg+3nQlYUP03LOMRlAW985aCKM3sEUwUhf
 tOgEz3eqyvC/3GDnz/Fy9MLmrRuykCxRHNaXvObUUof0AoJTqShbcWBVOkmdg62DQOci
 9WCofJjGEtyRAFtYgAQKxEsX5Htlqw+ac8kbHPkwRgsVTfYauW0yi6UWCND3Xd4lkrth
 7gvA==
X-Gm-Message-State: AOAM530IA8v+wyaJhaBVvbwWQmGKFDXys5uNfeRW0rz/2BBH1RTSQi8+
 WvwK1Zt6oH4JS40OsdtJSN1ZpQ==
X-Google-Smtp-Source: ABdhPJwfQsQlr42IbbgnL2l/mo+O1GtgjA9tgx4hdO6HnVLmfFKJ8G+PkJHJA2xGaCOxHLJ8ubVv/w==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr44917815wrh.330.1636968551390; 
 Mon, 15 Nov 2021 01:29:11 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id
 u2sm15871407wrs.17.2021.11.15.01.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 01:29:11 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, Dmitry Shmidt <dimitrysh@google.com>,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: add cec nodes
Date: Mon, 15 Nov 2021 10:29:05 +0100
Message-Id: <163696851316.448838.10307717773400137681.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007180130.805401-1-dimitrysh@google.com>
References: <20211007180130.805401-1-dimitrysh@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012913_065314_3208CDAF 
X-CRM114-Status: UNSURE (   7.87  )
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

On Thu, 7 Oct 2021 11:01:30 -0700, Dmitry Shmidt wrote:
> Enable CEC in same way it is done for other meson odroid devices
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/dt64)

[1/1] arm64: dts: meson-sm1-odroid: add cec nodes
      https://git.kernel.org/amlogic/c/83c9eee72603adbaaf0420eb2c4d537a9d65d5fe

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
