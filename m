Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20891C282EC
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Mar 2025 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr2203O0a/dms5YlvPcie+2O4W0nEjYKOZRI10SorPw=; b=C8kjBzM6ZQ+evQ
	j/0x3HMm3GIhNDS2Gu/RtHaGL9ec98LBdsYjSMTzpwAUfTraYqvDV7ClqAxMO3YaaZwOKJOMyiRBE
	ZDsW+ix1umzJljmBDBxPUyEwk9R3Jh6ldpkivzuG7TYfBtx+84hrdnHXLOmBy73ZPiF61nbbg77o4
	53/mKmtESBAEmvxWHD5xnnSXbfdbHZcg7S/T5U+UZzAqLn9qxPqk98QxaIoBrwcU/ee8yJESa2I5V
	fBmkPQdbfIBpnJG5vMhhJF9KlcwXKQUvrTRjgtgUR33Lx2u38SYtuone/ifTuNif8DqkdvSDAT+TV
	3EUCValqesq9QmUdQW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Kj-00000006maX-1geN;
	Tue, 11 Mar 2025 19:32:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5IQ-00000006mIE-0Ubg;
	Tue, 11 Mar 2025 19:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B831A454AD;
	Tue, 11 Mar 2025 19:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F5BC4CEE9;
	Tue, 11 Mar 2025 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721385;
	bh=zTUZGlfaZpw/Esi/Rx26qQ9HkUg2MBXXI98BiYNbEkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkU6GE2ZoqCga4zPItg0MI/rxit2xUJe8qwZl6umPLewMufleSQJGedR3Zvsm5DC1
	 +rNO/0FQjmKvajmYeNlCmbEpGGfuO61bdGdmVLIFNQ1Hb9swc341BTAgKWQUYpItQN
	 xbVw47aMuuLuq3CAfG2m512Tm4+fCsmQ3ZhtcFShHjdpujsFFuzDJGyavOChTzI1lt
	 h2rWxY7opyLSOGeXjq8nP1DZGY0HDT9Pv7yQip9rK7OraJ79LQSZXGk0HzrWWduMkT
	 RH8Ea6xrJscRlNd4rwG0thXQBoSVW5i8txpSYm1ikphPUtbmrFlP+zsnhMIByUNkf2
	 SrW/RmFbsAwHw==
Date: Tue, 11 Mar 2025 14:29:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] ASoC: dt-bindings: meson: axg-pdm: claim support
 of A1 SoC family
Message-ID: <174172138330.4179604.2763607780913254611.robh@kernel.org>
References: <20250309182127.1322890-1-jan.dakinevich@salutedevices.com>
 <20250309182127.1322890-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250309182127.1322890-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122946_229047_2ABE7F34 
X-CRM114-Status: UNSURE (   8.12  )
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


On Sun, 09 Mar 2025 21:21:24 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-pdm" compatible string alias to "amlogic,axg-pdm".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
