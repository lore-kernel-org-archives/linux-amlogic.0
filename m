Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA77CCF9F0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Oct 2025 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LF/vKAPIN15GEEqsSCV7u4iNDc1vWbdI/I5u3hPGM8o=; b=nd3Ej3l9j992n3
	peDr9sMeftnvLYHmHLaTReMTryuyPWW0itOMSYKDiihhM4yFLlh8VemT2w628F3NyTM0Vitu8zVfo
	QG3+0BH8OIF9McmP0tX/bc5gsghIXKLieIoqlzsYae7UEfZElEACKvW8zbd9xhO2KvlZdlj93zIoi
	LlnXWJsMMGsxNjltPT6bCL6teu/I9Llqs3jbqBbDC5SCUU5H+SaEBIS16fg8dhBVqRsB3oXcQdgJh
	1AYGpMYkZd94YRB8E6Gx6aOu5G8/06GVp+rjplPF3tEyNPH57BojSH/yp0MM0Jeb8WRq3ij0iggpW
	9atvnKxbXuIJpiWLCBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9lz-00000002AGU-1uQL;
	Wed, 29 Oct 2025 17:15:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9lx-00000002AFn-0gP4
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Oct 2025 17:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72E3F406E0;
	Wed, 29 Oct 2025 17:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EC1C4CEF7;
	Wed, 29 Oct 2025 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758144;
	bh=aTH9RDC1w35QI+C/9O3+e03r8SlUEnN2DLEh1omTVxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F2oZiAzjXdNtAUAsY1CEl4tAmlmMYBM57LRusTm3JP84ay1DL5gLI7lJPQ7K+XZQw
	 POEnGzxvyeFJ7xFVORqOgxtbSP+rx6ffyYYVBjVHZtLvwAaQONKIJC45059WM/mKKB
	 voJM7vXDvA6piO/VKqu23xRA/HWr6AAVrbA0C0ZDMsMAkx+rqfXm9MjOyllwSYETpz
	 Q9P3n7ZZU5+azSb0hYgBixCfAYXTeFGzBh6z3vW2t4G1ESVuN+37mW0+75VqVu8ZYn
	 8oE/VV/5JMnFZ5IJBIngDjGzOujg3XGHhwmmhkNorZrvtDEE0Hfcaa+kHsAqm7SAO3
	 hvAWDiH4yehqg==
Date: Wed, 29 Oct 2025 12:15:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linnaea Lavia <linnaea-von-lavia@live.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
Message-ID: <20251029171542.GA1566240@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR05MB1027063F8AA9069B66A632C2EC7FAA@DM4PR05MB10270.namprd05.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_101545_224475_161A3197 
X-CRM114-Status: GOOD (  13.51  )
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

On Wed, Oct 29, 2025 at 06:50:46PM +0800, Linnaea Lavia wrote:
> On 10/29/2025 6:16 AM, Bjorn Helgaas wrote:

> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..9cd12924b5cb 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> >    * disable both L0s and L1 for now to be safe.
> >    */
> >   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);
> >   /*
> >    * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> 
> I have applied the patch on 6.18-rc3 but it's still trying to enable ASPM for some reasons.

Sorry, my fault, I should have made that fixup run earlier, so the
patch should be this instead:

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..4fc04015ca0c 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  * disable both L0s and L1 for now to be safe.
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
