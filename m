From: sjg@chromium.org (Simon Glass)
Date: Fri, 10 Jun 2016 10:44:46 -0600
Subject: [PATCH 2/2] board: amlogic: Rename folder for Amlogic boards
In-Reply-To: <20160610081912.GA5293@localhost>
References: <1465483543-2240-1-git-send-email-carlo@caione.org>
 <1465483543-2240-3-git-send-email-carlo@caione.org>
 <CAPnjgZ1zDSUbUh0YkXD4f+SD6rZU+Q8B8rW9+w-qnkg59xus3w@mail.gmail.com>
 <CANe6Qb8gdVpENDGTeR+tz6Y+0mvTRyEZJGHppDngEH8V3MAxCg@mail.gmail.com>
 <20160610081912.GA5293@localhost>
Message-ID: <CAPnjgZ3LqNyC3P1khtT-k1A4dADP6NYDX1MNXJFnTMYXd_wmhw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Carlo,

On 10 June 2016 at 02:19, Carlo Caione <carlo@caione.org> wrote:
> On 10/06/16 09:03, Ben Dooks wrote:
>> do you have git rename-detection enabled?
>
> I simply forgot to pass '-M' to git-format-patch. I can submit a v2 if
> requested.

Yes please. Also you can use patman which does this for you.

If your patches are in a branch with the correct upstream:

patman -nt

will generate patches and

patman -t

will send them

(you need -t because amlogic is unlikely to be a valid alias)

Regards,
Simon
