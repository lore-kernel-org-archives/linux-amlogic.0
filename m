Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8E606A329
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IPq2yesF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mt4fMWve
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QmdJGDGKfGYGH46EA3SgkB2k97oEqv7L7xkjlddoJNQ=; b=IPq2yesFHS2+NcTDTbrmEGIX3t
	r0wNu69IIqMRc7e9AYAX2xXfdOBFx6J3JlbW37dnQId4BAF5t9MgOCjdALtIaL9yH59OupbDt4nUp
	Fu/YLhCUOb34JEuf0IWeCizzDXq05C+KtZ91R+ujwSBcyG5EJ08Mlv+BgHEtKEL31IdeLfi43oXz+
	JC9D2k/TtcdV461iQpxKP1hbqAMjYA0N3m0Lds4uu6vtU+1Xh0YhNQMTq35ItYAJfqJmRTExbPgZV
	WAq0D0CnQNGb25fII+tscwt7797hyce0LZAwFaGrQv73NFazfoOdJUsZJJ0/qUMP/D8s2Pi5z/h3Y
	HMhSjYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJg4-0000000CO52-3Q0Y;
	Fri, 06 Nov 2026 13:08:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJg4-0000000CO4t-0DjY;
	Fri, 06 Nov 2026 13:08:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB27F41747;
	Fri,  6 Nov 2026 13:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E71F008A3;
	Fri,  6 Nov 2026 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970499;
	bh=Q2XxXyLnn3njFqADeLyzH8+KoIPL5C0YsaGXv/K6wvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mt4fMWveWj0v2A9Oge2UgT7fZ7UY61uJ2ZMoiQBDerqOfUinryjl7PLJwSNgEP/Xw
	 RPJLaBoRF/l97fjF+0gae+7eUqjkSYq3ILZj/mvcrQFAqJkJJRlTJLEYfpxbI7SaKZ
	 DRekVGiSjTxQE+7BOZnUfG5QWWZvHVIIRy5RKgs0qRPoX51LwlWDTjS7PeWpkfFiXH
	 l9U/XHGHre1kQdTx78/aPTNHNaDI5TKtq1zpt2b0BoV+cNNNb11kFL44On9inLf1zh
	 nT2nBAyLNnot2uY3UVBrdifOEZU2OnAXJVStl/Lqda8KnLPuy4FlxELKRzokDkFpwr
	 Ui/MhHXJHxG/A==
Date: Fri, 6 Nov 2026 07:08:17 -0600
From: Rob Herring <robh@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	sean@mess.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow
 wakeup-source
Message-ID: <20261106130817.GA2526190-robh@kernel.org>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:19:53AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> =

> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
> =

> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>

Missing Krzysztof's ack...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
