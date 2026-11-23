Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D4606A31F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9ZymkdA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Kxg01mX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PpFK1SztijXWAT66R5ZtmGu6R6VXeVeZAUWl0dHmLDQ=; b=y9ZymkdASqRtbrpjNINLA6A8Nf
	UbtGsoEtPJ2r8RgrG6qz9tf6q5zbhiY4DfgPdy3MAPt3q/tgVTlfwNofilgSWH1Q0/KoaWG1165+h
	i6asf6pUm129hfwFNLyKdCZmllW/7M02//ORVugicYxxIyarCOroyO9yhAdOx7BFFDO7Pqgsxhwpl
	tWdkaDENXWajTmlphivgtyK/Vd6/7jll8b6bBgUj6i+bI55vkt/CEgeF8CIE2/evgf3l46Z/1T5lJ
	3KSw7xtXgchvE5O1p9rCKRZgL+Rl1UsiDhHnGeRCWyhce5K6enq0t2LY7WZOQQEWgWuoPK3yKgz3n
	XQrn/b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYMS-00000004RxZ-3szz;
	Mon, 23 Nov 2026 18:01:52 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYMO-00000004Rwy-236Q;
	Mon, 23 Nov 2026 18:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795456903; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=PaEyfUHI9/dg2Kik0zoccRrZZeS8oCPNzXKct42xtmbfG1sZf7ENSKszKndKxPpppPLUn9jqDFg1bMH9/oECr2KyOwTObfomSzwWZ4D5sH4318qx8fIWKN8RE6fUo3iDG/W6c4hO46lmxUvgx7NbZQXR3hLJoih8q84cPvfK5Bs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795456903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vDttuoLtThpmrLHDgUDrvKFHZsebodC8mQspl8DHMwU=; 
	b=T6Q6yKHs69OGVVqU6pq4IQfdJlyAI81yHIBcuFVGB2FzftKh4QkUVkdHQ9z4phc4x2tAABLy+883RnzDGlWi+dHJVMF5gMplguY1xktpz/223/o/HcTEMlRKZz/HokdeKhuptkMZMTPVlxpBUx+gP5LKkpve/z0R/NYEFHO/LS8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Kxg01mX9YeAZiV9Qs1JStftSmBv4b9pv3eCwsQZnx6ouWvP6EME1GmujpM84Ok9QbXQ4jTAhqMNTzGJngNoNRimp5oO8GLtL6PioAdtuBLELn2YMO8nFZJCN4ca5kRomt+2K+qdlqw757oHQWVVWso1aOQ2ekav8bMiNO4CGiLY=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=vDttuoLtThpmrLHDgUDrvKFHZsebodC8mQspl8DHMwU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795456902105430.43361214454706;
	Mon, 23 Nov 2026 19:01:42 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: rtc: Add linux,wakeup-states
Date: Mon, 23 Nov 2026 20:01:12 +0200
Message-ID: <20261123-alarmtimer-rtc-priority-v2-krzk-reply-1@iav.lv>
In-Reply-To: <20261123-literate-significant-wildcat-dcfffa@quoll>
References: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
 <20261116-b4-alarmtimer-rtc-priority-v2-6-b2c69721e489@iav.lv>
 <20261123-literate-significant-wildcat-dcfffa@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_100149_080046_37DF37C8 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 11:48:11AM +0100, Krzysztof Kozlowski wrote:
> This looks exactly like re-implementing system-idle-states.yaml and wakeup-source.

Right, thanks. v3 will use wakeup-source with phandles to
system-idle-states.

Two questions before I rework it:
- alarmtimer needs a suspend state for each phandle. Is mapping
  standby to s2idle and shallow, and the mem* states to deep, acceptable?
- linux,wakeup-states = "none" covered an RTC that wakes the system from
  no state, e.g. meson-vrtc, which enables wakeup unconditionally, on a
  board whose firmware ignores it. How should a board describe that
  with wakeup-source?

--
Igor Velkov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
