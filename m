Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58953C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Xl4jkJ5enu0moropPXyirqx2/N2vZK97PQJG0w0xJg=; b=4RJAg8QS+qZkdr
	bhabUUwuxMGDRUNh8Sd1VR29n4J0xT7SRgtY66dZ5wZCJf4DvrS1ykJsC/nzPqw2irO5s/cpf/+Vk
	lAu12nTXEWiNk1t50f3ljbiGNVmf6V775yLPr2wvm6zkRt2hWnoxFJFcDZZwRfkAig7ECxiRTiOsJ
	inQOeWF8XDFW+vBQ0VMq09Oqp/EjUvo9M+/bUAoa3eT2K2y38ZyUADRpy39U3zWDl+2o2MAI+pVSz
	Z1ZBthVkjntfUBpeCHZOs14gxHrJoREd4Ajv0KcYch6y6+07iLEq6c3UCV/z29ayIcEnHcP/ywOb9
	m5ASN77U95WBCHaWxHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7KE-00HMaP-7o; Mon, 07 Nov 2022 18:58:26 +0000
Received: from msg-1.mailo.com ([213.182.54.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7JR-00HLtk-9d; Mon, 07 Nov 2022 18:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667847432; bh=k0P8ZE+uqQGVs6wL7Q7U7sf2vt2NmAe+s9GmSscWQ0c=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=eC9931eWOAk5D6YxDQdpohg9OWEYrmGecMyIJrZLxY2yaxzl/anSb3ebTj7ejMDgs
	 R2VDj5avBMf4HqebeaDNc/39cJTs8lVTmC6KZ1qM8kGfRs1YHOoCWxUfKCvrTWc7nl
	 j8atkUi9WqzVKfpAaso6Dl9riohSOImjHlqKpELM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 19:57:12 +0100 (CET)
X-EA-Auth: uJYbcnbU7/Gnv/kEAbQmGdQCJ/olU5GTMJpo6jMiKW/YsivpNT2VbpYQVLnhqIqXLpu6xC/hldMuQtAOfKssKWdyCKfS7j0U
Date: Tue, 8 Nov 2022 00:27:03 +0530
From: Deepak R Varma <drv@mailo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2lU/78ZFoVElIp4@qemulion>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_105737_484882_CF80132D 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
> Hi,
>
> On 06/11/2022 11:52, Deepak R Varma wrote:
> > Greetings to all.
> > My name is Deepak R Varma and I was part of the recent Outreachy internship
> > round. I learned during this program that patches for the media drivers were
> > prohibited to be included in the Outreachy effort due to lack of bandwidth for
> > the maintainers to respond on those.
> >
> > The Outreachy round is now over but I am continuing to work on code improvement
> > and changes. I would like to know if it is okay for me to now identify
> > opportunities in the media drivers and send patch proposal for your kind
> > consideration. I intend to send couple of Coccinelle identified code
> > improvements as patches.
> >
> > Please let me know.
>
> I won't say no but since the media maintainers will need to apply them,
> the problem is the same.

Hello Neil,
Thank you for responding. I will send in the patches. I am sure they will be
reviewed at an appropriate time and responded accordingly.

Have a good day!
./drv

>
> Neil
>
> >
> > Thank you,
> > ./drv
> >
> >
>
>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
