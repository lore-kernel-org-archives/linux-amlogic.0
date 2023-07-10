Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B2EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN8onT+L+Ou08IczZbOA4ADPOH5WeNtcw+pgsZgbpkU=; b=KO3JrRPPsnUIWb
	iUR4mRfUdhX4Iv8KTCrxmQXHtyTMWSUPLfiMFNLAu9xem8UiW6T1aMDb4vGyNIce81YQkSaHPcc+s
	OOFVWtqGXd2gKZuyR5QyAyJpwqEo9DEu9WrQCV3Wkqz9cx1ABkWO5fDJr9JtZ0MBtzEAJiqQ1QGdy
	ZlHj4lSJ6Pahtvu70Pq0/+pFLBOUyNvCQcaFZXwpMxhllOSFIejFz9aLVQRn4276c6Ww5t9SvxtOu
	eQXZLxuby0iBNHd4DBEt7jNue+G4/fmpmodOpIUyg5zb5rhxPtLsV4zB12ofzKaA1i4bNvMihtoPc
	NRBR7E0mfdYmisyYYsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqGt-00Be6c-0w;
	Mon, 10 Jul 2023 12:45:43 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIqGn-00Be5Y-25;
	Mon, 10 Jul 2023 12:45:41 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B2B8C5C0166;
	Mon, 10 Jul 2023 08:45:33 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 10 Jul 2023 08:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688993133; x=1689079533; bh=Wr
	gvfSK/ZjUnMocbnypFGx2Xu2Tz3bZYi5KhzSIRavg=; b=HfW8C5wWvq2nAWizjJ
	E4WtfRQ4petWcoSQ6q0lIWyXzXpmAu28ZnV+iEWxSjyiGp3QT/ansazGclbI1WPh
	Su0zHiFw5m1xXNT37hK7v370U1VWB4SpIQrCR1U9EtSVMJIuIobaQBKg6QzWa8Vx
	oDe0CizDplLYcnZ9A3QMibFpjS5yZxiBGMf6LiZcpMC2aZ9MKU1CURIuL8WtalT4
	7kcAKuEEOzF0isQMeeMtzROFbi31vervfvhw82Oy2tqIDytrWIQls6FMR+A/G31u
	kARY4iT5PTCKBwZn3KdWefT740SJkyf/1kZPGOj26rK0e8IiiW2I8loSlyyvdHjE
	Ij0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688993133; x=1689079533; bh=WrgvfSK/ZjUnM
	ocbnypFGx2Xu2Tz3bZYi5KhzSIRavg=; b=XwySPgjShiTivcgcO87lJeu+tsCXi
	46y9i6y8bzcsRCaUaVkoFhuL4ghB2S3GmwEK+ALBPlUpo9XuCxoHutJF/avr2N0R
	QjcFzUWgK8SbagUmPHhI6585NY1lR1104mBpvV3p9HG8akg8bpRf3lgFkPJy+JtD
	oB+c2K6UItXlfhud0cnZXi0g7gAOxT3L4r2U/h4oJ5iQiyi2akD6pR7MgJTf4Pvj
	DERhrrGvwapHWW2rOL7KVwYTyNO39YH2VxwISU+4ZjbQuqjReIW5cGICQ46a7hHb
	v7nUQpbFgK8v0fjmSztcgAh71TQ1MUzyYYqmqoSRWclYBmwO1wvkDHq9g==
X-ME-Sender: <xms:bf2rZOmf60ZQDGJgw3s8P5MRfo7CShCcZZPAIuV5AKPOSwfkFjvNVw>
    <xme:bf2rZF2IwKTaJzFicKJVcjZ-sEZ_HztTfq61gt2xvXzlhgQ6G7UxUSV039NsCkbou
    fs5qPenfx6yLLyOUp8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvdekgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:bf2rZMr1mXNHciHOBChPaW6Kq9Lz5-zJSwYwMIvseSyLPD_2DnIl6g>
    <xmx:bf2rZCmPfJL1nn0qaON3MrFyk0OVlEgZc-DMvaMTUu56DJMPW6CUMw>
    <xmx:bf2rZM2Otwu3AneCWbaQ71VydAQ8Ozmrj9Idq0VTY67Sb3hjP36Jdg>
    <xmx:bf2rZNLkOeVMZ5nvzl-PVhBKmJ7kMATU6iBPYONR472oQbo3nlvDdw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 395001700089; Mon, 10 Jul 2023 08:45:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <2ef84fb8-b5eb-4c9a-b8a1-0c5f33e7f572@app.fastmail.com>
In-Reply-To: <CAPDyKFoRtEXTGQkNzGza-sS_j1ajGmjtCTaoPB7PXVDE2bS0tQ@mail.gmail.com>
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org>
 <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
 <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org>
 <CAPDyKFr7Mqy5bisLcxcA_iEGWqL8SFt2mDDng7zYEaTD1vNisA@mail.gmail.com>
 <deyyt5r2wkxo7ily434gl3wudls2sbinkmnehssqshwnbzmlwf@lmqskj6zwfu2>
 <CAPDyKFoRtEXTGQkNzGza-sS_j1ajGmjtCTaoPB7PXVDE2bS0tQ@mail.gmail.com>
Date: Mon, 10 Jul 2023 14:45:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the genpd dir
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_054540_107333_BB4B2E69 
X-CRM114-Status: GOOD (  16.02  )
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

On Mon, Jul 10, 2023, at 14:37, Ulf Hansson wrote:
> On Sun, 9 Jul 2023 at 04:21, Bjorn Andersson <andersson@kernel.org> wrote:
>> On Fri, Jul 07, 2023 at 05:27:39PM +0200, Ulf Hansson wrote:
>
> If I understand correctly, you are suggesting that each platform
> maintainer should merge the immutable branch with patch1 - and that I
> should send the patches (based on the immutable branch) to each of the
> platform maintainers to manage. Instead of one pull request with
> everything directly to Arnd, right?
>
> This still means that Arnd will have to resolve the conflicts as the
> pull requests arrive in his inbox.
>
> Although, I guess what you are looking for is less work for the soc/
> maintainers, which seems reasonable. Although, in that case, I might
> as well share an immutable branch with the complete series, rather
> than just patch1. That should help Arnd too, I think.
>
> Again, let's leave the call to Arnd on what to do.

I think it's much easier for me to pick up a single branch with
all of your patches. For platform maintainers, other changes can
go one of two ways:

- send a normal pull requests with changes against the same
  files, and have me take care of any conflicts where they
  arise. Since most of the changes are just simple file moves
  rather than changing file contents, 'git mergetool' handles
  these fine is most cases

- If there is a non-obvious merge, the entire genpd branch
  can be shared as an immutable branch, with patches for
  a particular platform rebased on top of that branch.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
