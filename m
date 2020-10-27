Return-Path: <SRS0=N8xU=EC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE199C388F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 09:47:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D14020756
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 09:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czUfGP64";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJI0ue6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D14020756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UVX5BAUkPZqLA1E1QQ3EFCzKexg/sqndhmJj2PoudcA=; b=czUfGP64HVyc6J1AU1OsBlIAb
	RguMxHGPi39OYyf4zCwczps+6JDtQLdtyklRW1hQ2+L9PG5EO5v+lRiBfBimy/KeLTyVqpnH3RJtS
	yHVfYGuFKPZ+MO1wXFKVfd4iMNYft+II/Y3tG6au7rNVUPDsnMYFyo7wtZyO9nCUXRm0e8doDG6yA
	FSckwFYU5TMBVsFqiOu0LxIxFIieYNCSuvee3Tc0b0M0KNDPNOkW/Ic/OmeGF0aOngac3DWyXvkZN
	cCTJb21d3rKOMSUUZ3WmjiVni/LVcVIe1JIXWVZxct6FqTIJl9JGSaFynRTlvP/FN2qLtnD/W3I56
	uWjpgnYTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLZc-0005YI-G5; Tue, 27 Oct 2020 09:47:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLZZ-0005Xf-UV; Tue, 27 Oct 2020 09:47:22 +0000
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5B2922265;
 Tue, 27 Oct 2020 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792040;
 bh=pePoFtPEy8IVG6VlkBuZrKEtYXWcxBQKENVtERgQfJs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MJI0ue6km1F7kQv5y+hKQGqI3Cjdhle3R3hl/qGoEnsZndL7Mn2j8pLdj7Nl1nKNg
 QA48rbuS+4g47aVGKXFoRL70Cs3rwp0FDfzsOoG5/rFm3jsynQ+MwK/DGgT9WX/lu9
 4DR3zQzRo3u/t6U2cITjtfCkPoR3K+jsoQn69rcc=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	soc@kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] Amlogic fixes for v5.10-rc
Date: Tue, 27 Oct 2020 10:47:09 +0100
Message-Id: <160379198959.3923176.10234668578168616931.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7hlffshfu3.fsf@baylibre.com>
References: <7hlffshfu3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_054722_111409_7BB96CD7 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 26 Oct 2020 13:50:28 -0700, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Here's a few fixes for v5.10-rc.
> 
> This also includes the 2nd round of 64-bit DT changes submitted for the
> v5.10 merge window as discussed here:
> https://lore.kernel.org/linux-amlogic/7ho8lkl9fw.fsf@baylibre.com/
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 91caef27a15c25948b23f7d400a2c6d70720b2a9

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
