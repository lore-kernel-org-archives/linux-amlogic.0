Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0260DCA0FFB
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duFgFoeiYmqqEGKkzbjgKOm9/wipH/e/ApMbvQvRiS0=; b=wIZSceoJU4ITI4
	nScS3LBCcnoySCoQYzXVS7mor5qhEosGjw+qgCFE/S0l08KKfbugGHeTYRUHiACEVR8Dejm/NFEYR
	0J6EVuri5+35BPFPUmSKPlUsAOozsvFy5HBCDLp8o2GsYXfvuvfspsnoUh5VHSMpl3U9H++BQeBXk
	s4i42oymga7qRXHCzGW2mlWdGMLeBFHX9aSTQyntO0J8e7NwPtWa2Z18EooYx3TidQzQN4kj3q7uP
	T4PJx93H0zLjuceCtOMbSSpmk9Thy+oHDQtd27GdrCGpEm+aJM3yjTtLNDl7CDuRACgh1PtOjhE7v
	OhWFgZ4qX/Nb/pAj9k5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE05-0000000FATa-3gya;
	Wed, 27 Aug 2025 11:07:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCnt-0000000EvQS-0D26
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Aug 2025 09:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2915040B76;
	Wed, 27 Aug 2025 09:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBBC4CEEB;
	Wed, 27 Aug 2025 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756288252;
	bh=Z9v7tOyCLbVTC4vbmMT5DzEjyMHuEBoDGU4LdAB1szI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1rV1avxJGTQkHo2kkYr9KjIlQIEsq4jp2M+0eC+XLVYV2v/Z9KWSQZW06cy/y7bm
	 CGHKJcpZ8WOCC+igAh/FgfalIRE417Q2tNSs3Up4pJt11+6RGSh+jGMzgQ9jqDekHm
	 Ywzbnjx96ycDhZPFZwS+72u+/MRorJkn4I5QCMixVFFdFltmOnlhefAJh94kPz1PC+
	 t+b4UkMse3Er+MxQjpG4cDH5yIwKjZckkJeWQqhUaH1WHayO2XUNjrxYqvavjTFmG7
	 J6GV/vpAmc+Ymvn/fP5xCcDLUL0POUnb9GujFIBbhJN3PQTuUu3Ilxth9v8Z3EzBEf
	 70Ggujy2F15Yw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urCnf-000000002L0-1A0D;
	Wed, 27 Aug 2025 11:50:39 +0200
Date: Wed, 27 Aug 2025 11:50:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Carlo Caione <ccaione@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] firmware: meson_sm: fix device leak at probe
Message-ID: <aK7U7-ebrPcxwEIj@hovoldconsulting.com>
References: <20250725074019.8765-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725074019.8765-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_025053_125537_CDE86EB1 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, Jul 25, 2025 at 09:40:19AM +0200, Johan Hovold wrote:
> Make sure to drop the reference to the secure monitor device taken by
> of_find_device_by_node() when looking up its driver data on behalf of
> other drivers (e.g. during probe).
> 
> Note that holding a reference to the platform device does not prevent
> its driver data from going away so there is no point in keeping the
> reference after the helper returns.
> 
> Fixes: 8cde3c2153e8 ("firmware: meson_sm: Rework driver as a proper platform driver")
> Cc: stable@vger.kernel.org	# 5.5
> Cc: Carlo Caione <ccaione@baylibre.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can someone pick this one up (along with the compile-test patch)?

Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
