Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FEE9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYEInejLl2EJcMT/E5ViTdXkw9CAIj5vCTTPIcx1SBk=; b=j1BFzaPryTimvW
	c5Xz5SCc1BYyA2bC7dC7EiTZsQYXSwq4ZaU2le7DKHRRsfzk6GqERyQWKcDevAt4Di3ANH8HxiLcM
	l4ykbkIXQgGoYvEYPpT6LQpCWKJG4NfGH34upWNPCs/L9kxKAzDsfkrCci+dvQcxwW8xHoAlM9tQv
	Fnhkl9oIMUX6G3yhiIbEHmOERbSa6znvxIQ39ApXbQOFQoay0EJgFtxKBiZ1XBhhQhKssWN8/2xCX
	fvQc8dPtTSpT1wI+gEoKMcomrmurRPbYF0ZI/sSK8/3EMFlp5qGH0Izy/kAhpvRTCoVpbjll0wgsa
	Zv9wQN+AJ28b+dCPJXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslPT-0000000ABCl-3j7K;
	Wed, 18 Feb 2026 17:32:23 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslPR-0000000ABCL-3F87
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 17:32:23 +0000
Received: from [10.211.9.33] (92-184-116-230.mobile.fr.orangecustomers.net [92.184.116.230])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 6367840244;
	Wed, 18 Feb 2026 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771435936;
	bh=K594EibXGBP/sthHzmXtQyXiFHMo+WwD9N1ZlHXuwLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OJnrvazNB7xJb3+cKAjU3Xcw6D3owAM8J3/VcT0Vh7qlr906zD3TtACHjTuW83Ovq
	 cFiJEEg+3GjTsDiWpdY49YzmdIHUQxlS+yRKrdUFvl57fwbRTF5O8wqYF6M9gH8sPx
	 etOkeaaF9ih6au7hh8FFL1G8Wv+9ZbSOEkX9rrY8=
Message-ID: <2a66decb-aa42-4fcb-9e0f-57bbb6aef2e9@aliel.fr>
Date: Wed, 18 Feb 2026 18:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll
 support
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
 <tanjoa.3m1sr95zhvsal@postmarketos.org>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <tanjoa.3m1sr95zhvsal@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_093222_267382_B99DED8A 
X-CRM114-Status: GOOD (  18.35  )
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

On 2/18/26 12:10 PM, Ferass El Hafidi wrote:
> Hi,
> 
> On Wed, 18 Feb 2026 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr>
> wrote:
>> Add SYS PLL for the clock controller of the Amlogic T7 SoC family.
> 
> Your commit description is almost the same on every patch in the series.
> Probably having a more specific description per commit would be much more
> useful, for reviewers to better understand your commit.
> 
> There are documentation pages on how to write informative commit messages
> at [1] and [2], but in summary, your description should talk about *what*
> is being done and (provided that makes sense), *why*.
> 
> You also have multiple commits with the exact same commit message
> ("dt-bindings: clk: meson: Add Amlogic T7 sys pll support"), did you
> mean to squash them all into one? (You can do so with `git rebase -i`.)
> 
> It probably also would make sense to add a cover letter, which would
> describe
> overall what you goal is with this patch series, and on a high level
> (doesn't have to be too detailled, because you'd describe these in more
> detail in the respective commit messages themselves) what each patch does.
> This once again helps people reviewing your code to understand what problem
> you're trying to solve.
> 
> [1]: https://docs.kernel.org/process/submitting-
> patches.html#explanation-body
> [2]: https://docs.kernel.org/process/submitting-patches.html#describe-
> your-changes
> 

Thanks for your help Ferass, I definitely will.

I think I have misread this part of the doc :
"The Documentation/ and include/dt-bindings/ portion of the patch should
be a separate patch."

If I am allowed to combine the header and yaml doc in the same commit, I
will do so.

Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
