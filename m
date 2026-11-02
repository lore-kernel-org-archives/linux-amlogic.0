Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CF606A324
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v887k/U1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=DVmujmTq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N4iEy+8msRdKkUbUGv3PtpvxR7y5S7EG520BKmtYSUc=; b=v887k/U1vv+zPiq4BnSLY8VbAS
	YlH1gZlpZ+nKyR3ceOFSZIEAmoZxzJ3uTbMU0kepixM1SwnxRBw6Fr4fjjVKYTGrzv5UdZi6Z0ZIZ
	olX1Jo7hOrz1tq3LIAWxpx/xxZNiHwQFcDnOfO44pIYtTYtR4dTutR4Y28QSz5hfryesqxd8A6A5S
	+JWRR5g5IZ4LUCNZPWkOSRBFyPHbZ0JBVu71Dr1uLrNbKAKcE9+rZDV73WcQSCgsx1idNboyc8o8b
	odW4mBRME2wqyfbiPD+Miu4QQSXvbqGRxXbfUlCIKN3t09+smRHNuN9x6v/Dg9R/OSwBdM1aUvz1+
	aE0pWexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx3y-000000001CP-2IpT;
	Mon, 02 Nov 2026 18:47:22 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx3v-000000001Ba-10M2;
	Mon, 02 Nov 2026 18:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793645236; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Zkn2GuBrl05SyPgpJBDKZgk2GtIWxCiZNk54ydBsUqumJ/akv3BHDV1vQ0nuRh0HP4zN9J6sfELuCGZ6FcmOcVp/5G6PdnEAMOsJDULAhLgB5yq397qU1JVAXgrmScG5Z/A8AdjKbrj5XqL5yUyRkSxX6HtpmcHN637mW1YnGZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793645236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uyvo3wdoYbKrilRkjYo7fLfmG/t2dpw+6Ib0pAGLtl0=; 
	b=fXeaVN79ALoS36Gmb67ewHANqZPhP1BSR1ry0hlfZzgIERB/b855PMCsp8Kt55HaUn03Jn2Es7jSv+226GhLejurKuTgl+OPOZcvvR13aK9uBbQliOe3FoMCaFWimApc78AAGDmvtNKXsKu5Ya0T0OinlJ8H9v8fDehmu61Y9Vo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=DVmujmTq3XotD+cLHTmQ6U+O3RtqOLC5zb+saPbwpbGEYq3nKOsltiyKyQvyyVDXQ1vaTL3iCj66D41fo7NAqD5uIBu/ypK5lsSvwVB3c9N5CR42fcbalMTiyXOo4YrLKagyGe85db8KXWbNW+jDEArzqDrxj23qxenAcyXk2+w=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Uyvo3wdoYbKrilRkjYo7fLfmG/t2dpw+6Ib0pAGLtl0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793645235494685.0284448194957;
	Mon, 2 Nov 2026 19:47:15 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
Date: Mon, 02 Nov 2026 20:20:03 +0200
Message-ID: <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_104719_542607_BD2CE85B 
X-CRM114-Status: UNSURE (   4.53  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Neil,

Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
it in for-next. Could you pick it up for v7.5?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
