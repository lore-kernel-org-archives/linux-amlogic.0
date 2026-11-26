Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF7606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tPGsmGCd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWHOsaxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+24UwBUd3VOI4YxS+cxQ+0nFQ9aQ5+1Npb4OuKNbeEg=; b=tPGsmGCdBgNT1U35OmpRpwxwyb
	5tpznAqlenvss7M2Ut5420NwK9cG4WLZGdP0lT5w08D7gJPAakAFL+DdkJk6tIfy7rtM9fMKJtTQY
	7Ha0R3FSDqOxNfTmuc5H5P+FSTQtH3hfSwZPw5+O3BwFMhRTuBohBeOt2+WpVEWwIkIo8RsDzDPkL
	Ei5OGwt/XWnk5aZCWUHkospX9qeNKA1uGI+1YB0XgfAHNKtk+MFtFnnztgpz9KzL76gfAjZSctRXu
	vAc4k1WbLRr0146EnGAjWbTXQnjdkysdCrvmCAX74dVdgay4eHl46DwPdOcwe4aO1BDXzHjsoEmAb
	pIByooUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVpX-0000000CZD6-2LNW;
	Thu, 26 Nov 2026 09:31:51 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVpU-0000000CZBc-0Oth;
	Thu, 26 Nov 2026 09:31:50 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A0491201A64;
	Thu, 26 Nov 2026 10:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiE2A+nPWbGW/mZXk52KfFKJUg4c3K9Dh4chIc2gpC4=;
	b=SWHOsaxWA0zf75mAhcC4osWitX6SywANv2RbLcM+5sYJ6tSEaeAZPQ7pzmWTx1Qde6LypC
	ZUyuXGy1Bi+6pu8TNw7P+nj+0n3EAcCNgSDAEBJ2GZPE3DFL1UQLDEv/erM2p5TUiFMf3v
	vyx0I0Ka9FY/5y2OPeuyQsiMQoYq/+qx1vufLHOeVY9bzhjLf9Z3NgaSs6wL8Q4KBzKNBO
	j5MH3FxKZGdQ563XMf0D0ULcycJ7uU4vHOqWAKyjPF0SETRckxEu5R82J16q5+sX4Osa91
	OCi4FIGc6oPhT0k2Y9IYqEMjuCHgcHevaWj1flNN7+S4yEirOYcaop86ithrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiE2A+nPWbGW/mZXk52KfFKJUg4c3K9Dh4chIc2gpC4=;
	b=QjNOwqtDTmxWKFMfwvple8it0GEaYu+5eKaV8wx0mo13I/kgVHcDIxllQT2nOBFxVT84Xw
	fCBwHCM0ak42VNEa7ICPb1aAD+EJfGSv/LlqnI5hcggfnfVARbBgcidSTYQUlUE8nkNsXC
	/NARyNy0RabDstavRJ544MqZvoznU5PqDGmzjGeWgrch9GeOCdtLQJdJJ19wP65t9rMrmY
	St/natczgTmGzg7g5qMtDPodKt4tlg0ADgOdMWhyrZS3FV+AzY5aUHvWljrmBkJIkxeShC
	U1uAP29wbjHxka5u7igTcGfFl+3h3TYvAmdB33FudGO+STOdoAd0wXgr6x/HAw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795685505; a=rsa-sha256;
	cv=none;
	b=RioTwTWTH3V7nOMvNr3+JCxK9ympGMTVLjUQvJHoroWJssJlkQ/SOItCduf+6AcYZJVheU
	EkmeKp9ImHPVl82NnCHYqs/0Tnh72eSdVOZEXgQO2waCschYSp1/Mqg0oaFR0RXX3AyGP1
	hpfiRJPoZxO3qVYcaDcu+f7mK4aK5pRAZIyoet1EH08eh8hMNzqmeebpxQZ7xiHHhCcAlg
	651uuWTdEyeyW1g9qXwkukp26THBbGOSuoLTDfviynHna+ff1/1/E1hLEL/XjgZ6Nl9T7x
	Dh00eElh8oiTha1Yhw7ZSyrojfir1Q+4Ts52gIy9jfhbK8NbOfdcJMZAuEc9Sw==
Message-ID: <cc7b9e00a518e234a81f18cbae805babd8452550.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v2 2/3] reset: amlogic: Add A9 AO reset
 controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet	 <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:31:45 +0100
In-Reply-To: <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
	 <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013148_590239_5F0871A8 
X-CRM114-Status: UNSURE (   5.33  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-11-26 at 09:24 +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the reset configuration and compatible entry for the Amlogic A9 AO
> reset controller.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
