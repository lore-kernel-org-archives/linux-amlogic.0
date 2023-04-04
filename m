Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1BDC761A6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YlYhrgxQ6ZRtCYPpXGDi2QGbloWzF6WDyT4I6XxDAF4=; b=vMLhfwZ2KZNHvkk4pPsHEXKtaf
	lXUa6fQ7Z/mYKE4lQQUTS4tNk4OxK+VY4NE5WVbavlWaweTyo60U/CMuFjyaLJSIij6ixBpcLc7Zi
	S/25XYv8o7Iy+qxr2TtW46lOc0vnwCKMpkvrPA5QFkdwbfsMt5fDrcIANBibV0H1ylQs7MGuS6rif
	6HdYT2RaR7BolplU52qAPp0So5s3WDa8jtlKtouoTa5wOppvS15OMEGZYnEam6HvhH733XzW+91Hm
	uq4npxk2uvfY9gOHiNuBBt9eN4k6+MG6ukxM/beSdyMbtlThYaSohp3k8mH/PZdIWaOnEBnN2gzv1
	ejcJ0xfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjdob-000sYF-08;
	Tue, 04 Apr 2023 10:23:01 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjdoY-000sWb-1y
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 10:23:00 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pjdoS-0000Kc-Kp; Tue, 04 Apr 2023 12:22:52 +0200
Message-ID: <8dc2a1b9-fa4f-417b-4faf-2a3a7872f503@leemhuis.info>
Date: Tue, 4 Apr 2023 12:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Kernel Panic - V6.2 - Reseved memory issue
Content-Language: en-US, de-DE
To: tanure@linux.com, kernelnewbies <kernelnewbies@kernelnewbies.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680603778;92232461;
X-HE-SMSGID: 1pjdoS-0000Kc-Kp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_032258_789565_575D4815 
X-CRM114-Status: GOOD (  17.07  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 02.04.23 10:10, Lucas Tanure wrote:
> 
> I am trying to fix a kernel panic I am seeing on my vim3 board (Amlogic A311D).
> I don't have enough knowledge about this area, but my current guess is
> the kernel is using a piece of memory belonging to ARM-trusted
> firmware that I shouldn't.
> 

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot (note: the version specified below here might not be fully
accurate):

#regzbot ^introduced v5.9..v5.15
#regzbot title amlogic boards: random kernel panics (memory corruption)
#regzbot monitor:
https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
