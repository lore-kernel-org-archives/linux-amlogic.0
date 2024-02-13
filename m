Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9CFC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoD0nJnoTi3d7tXzZgYUKEM+IV1Ma8aLAzbRLSZK4A8=; b=wwGMWUuslLi1rM
	ixmg2DjnMjnHeRArhQsKrIQtj7Hpd31ErMUdJMGkgR3o61hdDBD4amtp8TrpJ9dUVm2vvHmwflNl7
	5s7rE/sri0+v7hM4QnrbEMPNtJxpOPe5RNCs5xSUNhYZAdzGwqNw1DkvTiHYjXt3nL+Di2xY1Fgfi
	jIdoKiYjCjDNMEnweOR3KVBH/6TYV8fMC+TLCjRhqFRsWuidtHxbVmIL1WpAGMg8ZBOrnazS2UsN2
	RIOp19xjjjJVcWtglI6Q3tzHtXVaIunzZVHQJMoNcubJgNmc6FkVrXAcEHWLNdlBIbG+HRN3l8GlR
	UnrWBZmkcfhuB6urpmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsAX-00000009E8d-46PH;
	Tue, 13 Feb 2024 12:45:49 +0000
Received: from wfhigh8-smtp.messagingengine.com ([64.147.123.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsAU-00000009E7B-2eoN;
	Tue, 13 Feb 2024 12:45:47 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5A0A818000B3;
	Tue, 13 Feb 2024 07:45:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 13 Feb 2024 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707828340; x=1707914740; bh=USQ9m9LRrK
	EPc6jBigxNFqy6LATxlEiA3y2icE1wmKU=; b=MVKdScjiFTQgmJvjhZ/2M90i23
	l/fpMktEDMfJppqKTT+/khsgDio7EHjaZpT3+9qAwiIYyrPwVot9zpcK61giOCak
	sIqQPDL6MwOZ6UxG6xt+gOngE22lnvjTE+cWfkiUp7+CkBaS5PTqPtRevSihjC6N
	jF0VG3bXfrlI0qoJWP96QJj4OMcsLGphzGOjK+mwZ7keX6moZ6CeTN2y6SGv4IS6
	/BeeBELwCArYgSZ9aULHv5tu1QPUHusDXOUBQ4g2ShQKjZvqPfwVjN/C1Ydg1vf1
	UFu7ZAzc1PCrIOeNKl2RtjXW69ZzJKCKIlJ4kMGU9r4KrDldt6RBwtYqWGvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707828340; x=1707914740; bh=USQ9m9LRrKEPc6jBigxNFqy6LATx
	lEiA3y2icE1wmKU=; b=TBER6n7G5KS+2jvixiyf2/8+env6bDAeIKdQkwLvkZ9l
	iUVf4w89ofi1RB6FWoUfCYdKZiz5bWGUzvEDR48HK3qdMp7M14hcOV008HKa0515
	tqsN1Ufogx5x+o5dO4kXPewWYmEdLZLXzJZWZ5Q8VvZL4MfHCAT7Jhd+qJgPpzS+
	yh36/WcKtzvE8Ip/rLHsrsTxjQRPmQDYjOmpbLOA/BfSnD7fvMICgzixFkHsZssE
	SP8E3pOsFhc4YE0j+D0x9gbNQei92jFDfdqICSWsno6APWJv8kZG217EJAY4y/5y
	EkFSwgwgQmrjStWhlA+6K0Ysk0CooMERyftl1YjZYw==
X-ME-Sender: <xms:dGTLZeOFthVxaGlMlICy2zGBpA0Z9TCq6WI-dId3lOjYJ7lkzg5UuA>
    <xme:dGTLZc8PO8q9wAStqrNZzGENQ0Xgjydxie-zGhbHrV87qBUbjrsjyr0kyMGwdcFLX
    3liXcS8Kvt18b56rQM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dGTLZVQNjjdd2aSfuCueS9pgZNw49IrY36p83cr-ASUb7aFulkrusA>
    <xmx:dGTLZeuQyK3SCb7oueqV76z-aoKjGHEm4s-SqW7YEoJYfnCDg1HMFg>
    <xmx:dGTLZWeagM_-E5iIblPxOi26bQkryjltXKLm3wz-gheyUySQle4jYA>
    <xmx:dGTLZTCmdRiDL29BNyTl9Wf2np2S9JNbm_VBLoSQq3WyfxCaVWOMriXxAjc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6D8F2B6008D; Tue, 13 Feb 2024 07:45:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <bcd477f9-8619-4121-83ce-fa8ba05a36aa@app.fastmail.com>
In-Reply-To: <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
 <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
 <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 13 Feb 2024 13:45:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_044546_725725_516E4D0D 
X-CRM114-Status: GOOD (  14.20  )
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

On Tue, Feb 13, 2024, at 12:09, Jerome Brunet wrote:
> On Tue 13 Feb 2024 at 11:52, "Arnd Bergmann" <arnd@arndb.de> wrote:
>
>> On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
>>> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>> This probably pre-dates the introduction of devm_clk_get_enabled()
>>> It would probably be better to use that instead of duplicating helper
>>> functions which do the same thing.
>>
>> Ah, I had not thought of that interface either, so you are probably
>> right that this is the best way to do it.
>> Can you send a replacement patch then and add my Reported-by?
>
> Sure.
>
> How may I reproduce the problem ?
> Just tried with 'Debian clang version 16.0.6 (19)', no warning.
>
> I suppose I need to add something ?

The warning is currently only enabled at W=1 level until
we have fixed all the existing diagnostic output. I have
sent the other ones today, but for now, please test with
'make W=1'.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
