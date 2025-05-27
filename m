Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D70C54ED1
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 May 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EIBap1F7s1DF5ngwOpxjHy+6Thjx5is42H3yD0GibA=; b=sgUVlGW6nsjlUC
	PV/9E78HilBA1HvFQR2zCjgJEyDZwYNKhehJvinElgtuTvApxkEzf0Ii22Z2qB+eP/1zgvKxAXlhk
	5Vro16kEazdagBmBw6z/dosPMC/CVgbcNO6u+Ck3Uf8cVkYSWIOGYhvv7m6lGFHMSTnC/NsFBQUhM
	m5HecTyIlMIUbjJ30mNscoBClaKlhF9v/uXWO+Sx/oSEXvLA/lby2JvtNE0BXnKOzCtHRA/6HL7WX
	p4KKUWI/MT242gRVBNdJGCqJ3snADoatW87viYZPpnxdpY0SynHtO4NExt0AZwibmY7NRSSVmzvU/
	sMo8tgFeLkK+CRb5XUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpxq-0000000AIAj-1cw1;
	Tue, 27 May 2025 08:47:14 +0000
Received: from s3.sipsolutions.net ([168.119.38.16] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJphG-0000000AG8k-17IT;
	Tue, 27 May 2025 08:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bokkXsDYu1IhC5cK4pIZHGBgDHkECzX1dIxfgDAGs4s=;
	t=1748334604; x=1749544204; b=JRNNFDFzKuFSplePkm/68kLaO/7LMXdox9pfUnQE+NFGDBK
	qH+p1h9UlACW4GKrH89Az101atBbAXFeSeS4KypL85O8NVJ8jJhjz62Xgg/QxQV0kmErRPPOpE9Aw
	mqEYZxqU06S00Ml6QDo26e6ze8fyW7KtbbkEYsiwtTkcbKmmhwzP0GYps41wUtjcqqMd9cmoWS5Nv
	CpynwW7iD6bArZmCdco/Qx7eLJ8A29Zd8Fd/ZwQObvVS3a8em44i7tQVtbkzxW8dWRt563bpkE/kN
	Kaa9BQPgW6r/fLZSC8pECfuu5K/4as7loRQl7ePKKg3Tt1HTZlmlpPyCwPylnciw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJph1-000000000cV-1wqn;
	Tue, 27 May 2025 10:29:51 +0200
Message-ID: <d33cef50af049c296bc22f1d497993c8b1c74e52.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 	festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Date: Tue, 27 May 2025 10:29:50 +0200
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
	 <20250527082446.2265500-3-aichao@kylinos.cn>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_013006_314037_316A7043 
X-CRM114-Status: UNSURE (   4.78  )
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

On Tue, 2025-05-27 at 16:24 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

Why are you resending this? You haven't convinced anyone of its
correctness. You haven't even convinced anyone that you even understand
what you're changing ... so I think there's not much point any more.

johannes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
