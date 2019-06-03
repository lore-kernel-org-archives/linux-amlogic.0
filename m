Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB3DC28CC6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 21:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08ECF26D15
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 21:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pB5gHIWT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Rfq++3K2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08ECF26D15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hC58pZc7FHKfOdeolQVSEtFHoos5GXZR0Ar5/RfAgh4=; b=pB5gHIWT/q0romPkMFdZ5C/Cu
	Vvs9asmW2oWYIcEs53Q0SR2iwOyapuSg57aoCWUq6GLPXVa1YUCx/vVoQUwBuQ8qFJLP2YBnqVKAZ
	Kvun7LKno2dbEpj0AnxwM310VSDcqG+lxKj3LFwot+Q7WVYr4NdFh2JYN6b7c8pZQH/BLLg4dJUUM
	qUOQRI0E4qGLlEucVKUwkSc/SkOxpzGK0bdLvArts4JcyKyRnuiMOTZmh8Xq+yQHBDnacHlUCxJpk
	TppLf83Tw0Q15OpgNRVvLzGfrnJzJGeUXkxRIKN3UB/ml8h1tLKUBTyTBWwKUGDoGFbJLThN93YCm
	R4r28RYvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXuxx-0000aR-AY; Mon, 03 Jun 2019 21:58:05 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXp5t-0003TO-Vz; Mon, 03 Jun 2019 15:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1nerRAALIr+GbFV8r1sFGZ42UhtZBI7DJIk+wBaRWY4=; b=Rfq++3K2CPz/V+xtU6FTwnmqV
 IrZkS8JUafj4B/5u2jbV1gF5lzZyd9isVPq0hf5673+l2SKd1sxHzHMYLDaBSNAPoLzxFQZz0hlU0
 VtxIW60leJ7SHhCzEfDkc4gMVE5CU1hjWUpdByTfPbLiJqn67GDK4S9nwoWk8/8XdK3gg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXp5K-0002FH-HL; Mon, 03 Jun 2019 15:41:18 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B00B8440046; Mon,  3 Jun 2019 16:41:17 +0100 (BST)
Date: Mon, 3 Jun 2019 16:41:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
Message-ID: <20190603154117.GW2456@sirena.org.uk>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_084154_172868_C4243C85 
X-CRM114-Status: GOOD (  12.31  )
X-Mailman-Approved-At: Mon, 03 Jun 2019 14:58:01 -0700
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Lutomirski <luto@kernel.org>,
 Wolfram Sang <wsa@the-dreams.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Paul Mackerras <paulus@samba.org>,
 Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel@lists.xenproject.org, Jason Wang <jasowang@redhat.com>,
 Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Jiri Kosina <jkosina@suse.cz>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Feng Tang <feng.tang@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-mm@kvack.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yannik Sembritzki <yannik@sembritzki.me>, Harry Wei <harryxiyou@gmail.com>,
 linux-i2c@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 YueHaibing <yuehaibing@huawei.com>, Robert Moore <robert.moore@intel.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Len Brown <lenb@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-pci@vger.kernel.org,
 Bhupesh Sharma <bhsharma@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 platform-driver-x86@vger.kernel.org, Quentin Perret <quentin.perret@arm.com>,
 linux-kselftest@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Raphael Gault <raphael.gault@arm.com>,
 Joel Stanley <joel@jms.id.au>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Darren Hart <dvhart@infradead.org>, linux-edac@vger.kernel.org,
 Erik Schmauss <erik.schmauss@intel.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Palmer Dabbelt <palmer@sifive.com>, Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 SeongJae Park <sj38.park@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org, devel@acpica.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Olof Johansson <olof@lixom.net>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Michal Hocko <mhocko@suse.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 David Howells <dhowells@redhat.com>, David Brown <david.brown@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
 Manfred Spraul <manfred@colorfullife.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Andy Gross <agross@kernel.org>, Dave Young <dyoung@redhat.com>,
 devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jerome Glisse <jglisse@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>,
 Denis Efremov <efremov@ispras.ru>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andy@infradead.org>
Content-Type: multipart/mixed; boundary="===============4959878358372958942=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4959878358372958942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ULJ2Z7kCM1hyNsWd"
Content-Disposition: inline


--ULJ2Z7kCM1hyNsWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 29, 2019 at 08:23:53PM -0300, Mauro Carvalho Chehab wrote:
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.

Acked-by: Mark Brown <broonie@kernel.org>

--ULJ2Z7kCM1hyNsWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz1P5wACgkQJNaLcl1U
h9CgCQf+J9k75rt3mgSxGm21PStcBWah+jHorcSB3vAFo/VgwBXCI7/qQymUKkNd
rUN0absPBGdyjsU+iDp0RrGijvdavWuigfic8bEJ/z2tbzj1I3+XRrah0tiPgdrF
6/uFF/xfdYflsvBqmmu+/uXwwvzWtE/DITZ/m7fXcUjk8uahw4sWCAiyoPAqgUCL
otIcJ8/L/0bQ2oiDiLTBqWp/NcOepodvjV5BcRyh49dwR0RDdBVxfdjyVboI9WQN
YK9ZiCa/QaQRl0S5ce7bPH/c4U+mujmla7rE8icfqRDhtsMuXa+JvQMCPEIfnzxe
kGqmVHCLVcqZZ5sJZOMLQSVlIsbckw==
=aP8U
-----END PGP SIGNATURE-----

--ULJ2Z7kCM1hyNsWd--


--===============4959878358372958942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4959878358372958942==--

