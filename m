Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB4EC4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 17:40:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA38922AAF
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 17:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA38922AAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CD3RBrBb/3YHMb22mXD+FhsjP3GvWtiziPTSz+p/CGw=; b=A8KvQBUgPLnTbZ5GWEG47vDCQ
	9iqBDznIMKfObrJOnsY3Hp2jI1abnct8XyWmYWJSFiqvWSyzSoPiyBui8/DeNNmHuize2gVWS2zhN
	6rpAJtZG+abhnJpr6dvFkbACoIEBGnQ5pNfuD4xw5WHbaBulitKGfENKAYPtSCV60RfVfT2MYNAGZ
	8OgynE6CaX7SZJB0d0KF7m/4olNXHUmZqKaxmUptCsWvzFWOkIJbrZwzRKtIZpicpcKiQridtkIv+
	ok0vGma+pJLifl0GBBJzobJjtx79i1/c56FsWEOd0byLoB0X1ISzTFeJvq2oGZ8XZimzus4ylFij/
	ghNCQTRHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klbXl-00077g-MV; Sat, 05 Dec 2020 17:40:25 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klbXi-00077A-23
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 17:40:24 +0000
Received: from odsus.home.arpa
 (dslb-002-205-253-229.002.205.pools.vodafone-ip.de [2.205.253.229])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id 0AE171F416D3;
 Sat,  5 Dec 2020 18:40:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id 2A57D3D671;
 Sat,  5 Dec 2020 18:40:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxNJT6mAEhb3; Sat,  5 Dec 2020 18:40:14 +0100 (CET)
Received: from [192.168.20.240] (r64.home.arpa [192.168.20.240])
 by odsus.home.arpa (Postfix) with ESMTP id 6CF213D66F;
 Sat,  5 Dec 2020 18:40:14 +0100 (CET)
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
From: Otto Meier <gf435@gmx.net>
Message-ID: <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
Date: Sat, 5 Dec 2020 18:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_124022_230690_78092DCC 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

i have tried your second notice. but it does'nt solve the issue.
if at leased on device is pluged in new devices are detected. if
all devices have been removed, no new device will be detected anymore.

Best regards

Otto

Am 05.12.20 um 12:54 schrieb Martin Blumenstingl:
> Hi Otto,
>
> On Sat, Nov 28, 2020 at 6:10 PM Otto Meier <gf435@gmx.net> wrote:
>> Hello,
>>
>> I run an Odroid-c2 with newest kernel 5.10.0-rc5
>> usb recognises usb devices only when they are plugged in before boot.
>> after boot plugged in devices get not recognized.
>>
>> Any idea where to search for a fix?
> there are two answers to this:
> - this was fixed two years ago with upstream commit cc10ce0c51b13d [0]
> - I think it broke again. off-list I received a hint from a user that
> setting kernel cmdline parameter usbcore.autosuspend=-1 works around
> this issue. can you please try this? if it fixes USB hotplug for you
> then this needs to be reported to the USB maintainers
>
>
> Best regards
> Martin
>
>
> [0] https://github.com/torvalds/linux/commit/cc10ce0c51b13d1566d0ec1dcb472fb86330b391
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
