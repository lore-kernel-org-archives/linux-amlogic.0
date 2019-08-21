Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B310BC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B022339E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 13:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bhfxUyn4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="c1PME/SJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="u8QzXJ4j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B022339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyP6DznZ9Ab1OuyZMjqqxoWlCDnIj5W8C56vzSS4qo0=; b=bhfxUyn4eTfocm
	Tu+0jnbqE6YpaqbQPvqqv7aVfu/92tUGQbH9PrENMgVd54E1QGQO8i/SJR31C07V/NYf42K07slSi
	s/JSdwfAYZKJtpKxx3Vq8o4Q+3a6vEC6tqvjUjQjO0VeTuh0zFoNy20ZRsLp7eJsb+wFRrCNIGGyp
	ifHgJ93zrblStWeS4AUy5f0DECJ7uddXtPJrPySsPg7v/lu+jlId7pLPIkJ6QOVQypkYhHuN32pGl
	7NcvrZ16vTTS2SRPbf3h7azQ6OzU/TRBc0rvAs/XQJ0q5EPj50MZslzHjU7Mh9aXl7NQXNglS6Ss/
	0ojSKJzGvieLlvizJY3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0QIs-0000JA-ON; Wed, 21 Aug 2019 13:05:30 +0000
Received: from pb-sasl-trial2.pobox.com ([64.147.108.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0QIp-0000Ih-A0; Wed, 21 Aug 2019 13:05:29 +0000
Received: from pb-sasl-trial2.pobox.com (localhost.local [127.0.0.1])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 61EBA1840C;
 Wed, 21 Aug 2019 09:05:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=8OJtyeNZ9sCoH4BVmhH8yW8Bvtc=; b=c1PME/
 SJzr4aFk09ikfKp1bezTdBSw1zwNS3hrdNtoOqlYZR7yA8XltYBalyFTKDMKbjP0
 N65/OlgmcPY1jK1+z15I44JCS9KM0+7x8/h7bHxlIX4/NT+azCbj5YqM8+gMtbTp
 uXIkLMunbK+ZmjnijFcehZ1TUdsCiepGgzujk=
Received: from pb-smtp1.nyi.icgroup.com (pb-smtp1.pobox.com [10.90.30.53])
 by pb-sasl-trial2.pobox.com (Postfix) with ESMTP id 3E97C1840B;
 Wed, 21 Aug 2019 09:05:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=V25/yKN9jlMjRVCEXCSuKB+Re2Fd96dfPM01Z+/Jqwg=;
 b=u8QzXJ4jPt13KgiTpgzojpKoWuF5UnQufQIrmIF1V1GDjy6AYPilfpABHbSnzJ1cD46DKsQ+JPEMRPYBtPL2vVu09z8iN4C6o7z6Kg63KVX0atNi1l+zBI4OCk5fsPv9COf6vzghotcslIvOnBR1dt1b3O/PjBpbMEOUK+25Eh8=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 0BFFA157B47;
 Wed, 21 Aug 2019 08:46:49 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 0CE5A2DA023B;
 Wed, 21 Aug 2019 08:46:48 -0400 (EDT)
Date: Wed, 21 Aug 2019 08:46:47 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-ID: <nycvar.YSQ.7.76.1908210840490.19480@knanqh.ubzr>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: BDE512AC-C411-11E9-A63C-46F8B7964D18-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_060527_584235_B033F56C 
X-CRM114-Status: GOOD (  10.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 usb-storage@lists.one-eyed-alien.net, Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, Nancy Yuen <yuenn@google.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Patrick Venture <venture@google.com>,
 stern@rowland.harvard.edu, kernel-team@android.com,
 Ingo Molnar <mingo@kernel.org>, linux-rtc@vger.kernel.org,
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, sspatil@google.com,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, jeyu@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>, Richard Guy Briggs <rgb@redhat.com>,
 maco@google.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 pombredanne@nexb.com, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 21 Aug 2019, Matthias Maennich wrote:

> As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
> That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
> seems to be some consensus amongst kernel devs that the export surface
> is too large, and hard to reason about.

This is good work.

One solution for drastically reducing the effective export surface is to 
have CONFIG_TRIM_UNUSED_KSYMS=y. This is more extreme than symbol 
namespace, but might be worth mentioning nevertheless.


Nicolas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
