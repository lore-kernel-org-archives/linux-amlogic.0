Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA44C433FE
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Nov 2022 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PoDyoetzJFLZrNbSAlAe/LVtJbCSUaCCcdTxGdViMTE=; b=bu9GIi6wq3VZl3
	N5hgW7ws4cCoVRXgNoXW/kGgg8eHTu43WeN3d7goS/o/koaaAquGOBBB9hIZDClQbGboWaoHu4LUT
	7NvspxxlEkafE8Qqm3Iq34xz/P7Fp44ZWNlsJtYr0Y1tqEdeK34X1bvy4wrR1mrSPcPkpcrGIOxdA
	dQx9pgE9hw2jgdjywUJeFZJGD/U/BA6HexaKwf6i0upRAmBpPq+YWaxUncDuIQCbsTEvktRyhu6Ps
	Pt4rQKxs6T+nF+2BIJw7uV367fWh+n9UrHRpN0P1Vzgd4dr0D7fjf4v4PaHNUjTkGQrGt/61oGwoe
	yjGIlqQIwlBvau7+cajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ordHU-0082Bi-Tt; Sun, 06 Nov 2022 10:53:37 +0000
Received: from msg-1.mailo.com ([213.182.54.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ordHR-00828P-Nj; Sun, 06 Nov 2022 10:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667731984; bh=P511zN2InPdNvrRnB0K28toXp6sPyjr5q7mpbN+Phxs=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Js4nOvXqElOPY+ADGQiJMuces9xrJoM0uvp4b1kcdgDOKJvvNG6mDaB8Y06ottBa8
	 99Lszjv4Jn54X3IH9R9ZcYLFQKVCoj8VRaHKdemn1l8vh1c8JxeU3oKovj+qgzsbTF
	 gt9FCS6wFf9Y7qfreMrz5ow/annq90luWmXYkJTQ=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 11:53:04 +0100 (CET)
X-EA-Auth: Hal3GwnzE98f7ibZUA1R4tCAbhvtkzya0fsqlGOa7fA9lTF2PWQ3UYiPofnxKw8kPk3sa+MRhvTsOHr+ioII4WdGqUdQ8cdR
Date: Sun, 6 Nov 2022 16:22:57 +0530
From: Deepak R Varma <drv@mailo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: patches for staging:media drivers
Message-ID: <Y2eSCZJNWn6DzCUu@qemulion>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_025333_929618_BAC9A105 
X-CRM114-Status: UNSURE (   6.49  )
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

Greetings to all.
My name is Deepak R Varma and I was part of the recent Outreachy internship
round. I learned during this program that patches for the media drivers were
prohibited to be included in the Outreachy effort due to lack of bandwidth for
the maintainers to respond on those.

The Outreachy round is now over but I am continuing to work on code improvement
and changes. I would like to know if it is okay for me to now identify
opportunities in the media drivers and send patch proposal for your kind
consideration. I intend to send couple of Coccinelle identified code
improvements as patches.

Please let me know.

Thank you,
./drv



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
