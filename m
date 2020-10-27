Return-Path: <SRS0=N8xU=EC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB413C55179
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 16:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5973421D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 16:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N42mGx68";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rm8lFjcL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5973421D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2xJSf55PdWlcscfM25Iy1EPthXHa2dWdo5p7OHyPT0s=; b=N42mGx68ydvDTYDyACPxWpoHZI
	Bkbi6pNuioXtBV1mLHYpDimO3GNctZCYP04olEnM0NCp81eOx5nhumf6oBtjh3PO3ztsxX9HADeUs
	uw7DthDlAL2BaE0B1Srggg7ai1MHUOrsTliZVVTJUVwSAdzb7MyH/wITLtTF+RDDIF5OrBhxNigjp
	VPs7vwOFeG5ch5ndzC2WQNdJCRkfc2dDKSQUt10MlnBCYwWkLvuZMRtEPR9MnPU7hcm1+UXhnpCrk
	EEK5usVmab/y8CBrBuxSqEJi5JYcrDGVFYR4DeT40O0eaETsriCSD9jqeHWFCrDUYILEn5gjzUPSH
	C+5+fOuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXS4A-0005KY-Sm; Tue, 27 Oct 2020 16:43:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXS46-0005Il-TL
 for linux-amlogic@lists.infradead.org; Tue, 27 Oct 2020 16:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603816998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=mj6uaiHROCag3uZJ/gHJroorYDnXKuN4EyYRFIYPu8Y=;
 b=Rm8lFjcLDGjqVK+tlzRsk5hVuzRKiz1PAzcIS7c2opzFTvN054de1Vj2dlRfrKKYMGkiBm
 gtoa0Aj2GP7OJ6D4b+nmSO+jFhDRdmS+Wyw7zDhfnjSzQvRZVwEVtbYOoWuvhD4RJ0zjvP
 C3ByGepOLdQ9UpNgeNinjXpi+99jaxI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-bJptS_faNP6AizjZuD6z6w-1; Tue, 27 Oct 2020 12:43:14 -0400
X-MC-Unique: bJptS_faNP6AizjZuD6z6w-1
Received: by mail-oo1-f69.google.com with SMTP id j5so1030551ooq.4
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2020 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mj6uaiHROCag3uZJ/gHJroorYDnXKuN4EyYRFIYPu8Y=;
 b=LViMGFmhRG+f4hyHBTXc0EM8KvPnLErm5/Zr0zkuGUMEiDdwbMDEI8PmyuIjQ+1dlb
 FclYsT6dzFS0zIJX7pMDv+Ov1tQ6/zhicptLWHe+xZKrRNsTqW5WNrVtOiCyqPG5+JhQ
 AtU3peXph0A4LNPSIrRfyWZ4EFyLdTIruN+sSyqCmAco2CkMEsISczB/JdIn5gO6xenx
 5+2XoCKwtRqm1A9FncOwKXjKBLaYoKh6g2oaxoE6DdWOiDgqbSFfCdqq9sgz7A/ofOoc
 ivjYBowrPBm63Xj1pZK3IvD5mP3V6K3BRVBPHE/1LCgTP5hh7PnZqmWj0Rvsk42DbCN9
 YvyQ==
X-Gm-Message-State: AOAM530HtZP/KH/cYRUmf1NKFmTlReTcRZJW0knOEA3sSGgTr9TP5tJC
 vrWAS5xmmYRQ6dfRVWwm/ixsfZjoxEGjD+mhY1C94GG8+Vgjas9J+H4qOZyQeSWNb97x6WWFMxP
 mMylggpMiy+p4ue/eJuoKJrL+rcpA9rM=
X-Received: by 2002:aca:ef03:: with SMTP id n3mr2048457oih.67.1603816993827;
 Tue, 27 Oct 2020 09:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7y1eCX7WfRNi9tkZnfLpiDio1qtG9FKTpwYlLMD9SlPYp6FIE57BquNUx5oTk2cs+UUc+WA==
X-Received: by 2002:aca:ef03:: with SMTP id n3mr2048435oih.67.1603816993577;
 Tue, 27 Oct 2020 09:43:13 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l89sm90968otc.6.2020.10.27.09.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:43:12 -0700 (PDT)
From: trix@redhat.com
To: linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Subject: [RFC] clang tooling cleanups
Date: Tue, 27 Oct 2020 09:42:55 -0700
Message-Id: <20201027164255.1573301-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_124319_062825_4CAA9898 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org,
 =?UTF-8?q?=EF=BB=BFFrom=20=3A=20Tom=20Rix?= <trix@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, qat-linux@intel.com,
 amd-gfx@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This rfc will describe
An upcoming treewide cleanup.
How clang tooling was used to programatically do the clean up.
Solicit opinions on how to generally use clang tooling.

The clang warning -Wextra-semi-stmt produces about 10k warnings.
Reviewing these, a subset of semicolon after a switch looks safe to
fix all the time.  An example problem

void foo(int a) {
     switch(a) {
     	       case 1:
	       ...
     }; <--- extra semicolon
}

Treewide, there are about 100 problems in 50 files for x86_64 allyesconfig.
These fixes will be the upcoming cleanup.

clang already supports fixing this problem. Add to your command line

  clang -c -Wextra-semi-stmt -Xclang -fixit foo.c

  foo.c:8:3: warning: empty expression statement has no effect;
    remove unnecessary ';' to silence this warning [-Wextra-semi-stmt]
        };
         ^
  foo.c:8:3: note: FIX-IT applied suggested code changes
  1 warning generated.

The big problem is using this treewide is it will fix all 10k problems.
10k changes to analyze and upstream is not practical.

Another problem is the generic fixer only removes the semicolon.
So empty lines with some tabs need to be manually cleaned.

What is needed is a more precise fixer.

Enter clang-tidy.
https://clang.llvm.org/extra/clang-tidy/

Already part of the static checker infrastructure, invoke on the clang
build with
  make clang-tidy

It is only a matter of coding up a specific checker for the cleanup.
Upstream this is review is happening here
https://reviews.llvm.org/D90180

The development of a checker/fixer is
Start with a reproducer

void foo (int a) {
  switch (a) {};
}

Generate the abstract syntax tree (AST)

  clang -Xclang -ast-dump foo.c

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt 
    |-SwitchStmt 
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt

Write a matcher to get you most of the way

void SwitchSemiCheck::registerMatchers(MatchFinder *Finder) {
  Finder->addMatcher(
      compoundStmt(has(switchStmt().bind("switch"))).bind("comp"), this);
}

The 'bind' method is important, it allows a string to be associated
with a node in the AST.  In this case these are

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt <-------- comp
    |-SwitchStmt <-------- switch
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt

When a match is made the 'check' method will be called.

  void SwitchSemiCheck::check(const MatchFinder::MatchResult &Result) {
    auto *C = Result.Nodes.getNodeAs<CompoundStmt>("comp");
    auto *S = Result.Nodes.getNodeAs<SwitchStmt>("switch");

This is where the string in the bind calls are changed to nodes

`-FunctionDecl 
  |-ParmVarDecl 
  `-CompoundStmt <-------- comp, C
    |-SwitchStmt <-------- switch, S
    | |-ImplicitCastExpr
    | | `-DeclRefExpr
    | `-CompoundStmt
    `-NullStmt <---------- looking for N

And then more logic to find the NullStmt

  auto Current = C->body_begin();
  auto Next = Current;
  Next++;
  while (Next != C->body_end()) {
    if (*Current == S) {
      if (const auto *N = dyn_cast<NullStmt>(*Next)) {

When it is found, a warning is printed and a FixItHint is proposed.

  auto H = FixItHint::CreateReplacement(
    SourceRange(S->getBody()->getEndLoc(), N->getSemiLoc()), "}");
  diag(N->getSemiLoc(), "unneeded semicolon") << H;

This fixit replaces from the end of switch to the semicolon with a
'}'.  Because the end of the switch is '}' this has the effect of
removing all the whitespace as well as the semicolon.

Because of the checker's placement in clang-tidy existing linuxkernel
checkers, all that was needed to fix the tree was to add a '-fix'to the
build's clang-tidy call.

I am looking for opinions on what we want to do specifically with
cleanups and generally about other source-to-source programmatic
changes to the code base.

For cleanups, I think we need a new toplevel target

clang-tidy-fix

And an explicit list of fixers that have a very high (100%?) fix rate.

Ideally a bot should make the changes, but a bot could also nag folks.
Is there interest in a bot making the changes? Does one already exist?

The general source-to-source is a bit blue sky.  Ex/ could automagicly
refactor api, outline similar cut-n-pasted functions etc. Anything on
someone's wishlist you want to try out ?

Signed-off-by: Tom Rix <trix@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
